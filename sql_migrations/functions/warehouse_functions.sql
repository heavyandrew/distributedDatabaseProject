-- Обновление статуса поставки
CREATE OR REPLACE FUNCTION UpdateSupplyRequestStatus(
    p_branch_id INT,
    p_sr_id INT,
    p_new_status INT
) RETURNS VOID AS $$
BEGIN
    -- Обновляем статус запроса и выставляем дату закрытия, если статус 4 или 5
    UPDATE SupplyRequests
    SET SR_status = p_new_status,
        SR_closed_at = CASE
            WHEN p_new_status IN (4, 5) THEN CURRENT_DATE
            ELSE NULL
        END
    WHERE Branch_id = p_branch_id AND SR_id = p_sr_id;
END;
$$ LANGUAGE plpgsql;

-- Функция для триггера
CREATE OR REPLACE FUNCTION AfterApplyEmployeeChange() RETURNS TRIGGER AS $$
DECLARE
    v_service_id INT;
BEGIN
    -- Проверяем, если Su_apply_employee стало не NULL
    IF OLD.Su_apply_employee IS NULL AND NEW.Su_apply_employee IS NOT NULL THEN

        -- Получаем E_service для нового сотрудника
        SELECT E_service INTO v_service_id
        FROM Employees
        WHERE E_id = NEW.Su_apply_employee;

        -- Проходим по всем записям в PartsInSupply для данного Supply
        FOR record IN SELECT PSu_part, PSu_number FROM PartsInSupply WHERE PSu_supply = NEW.Su_id LOOP
            -- Добавляем новую запись в PartsInService
            INSERT INTO PartsInService (PS_id, PS_service_id, PS_part_id, PS_number)
            VALUES ((SELECT COALESCE(MAX(PS_id), 0) + 1 FROM PartsInService), v_service_id, record.PSu_part, record.PSu_number);
        END LOOP;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- Создание триггера
CREATE TRIGGER trg_AfterApplyEmployeeChange
AFTER UPDATE OF Su_apply_employee ON Supplies
FOR EACH ROW

