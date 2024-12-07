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

-- Создание накладной
CREATE OR REPLACE FUNCTION AddSupply(
    v_from_employee INT
) RETURNS VOID AS $$
BEGIN
    INSERT INTO Supplies (Su_from_employee) 
    VALUES (v_from_employee);
END;
$$ LANGUAGE plpgsql;

-- Обновление накладной
CREATE OR REPLACE FUNCTION UpdateSupply(
    v_su_id INT,
    v_from_employee INT,
    v_delivery_employee INT,
    v_apply_employee INT,
    v_car VARCHAR(9),
    v_date DATE
) RETURNS VOID AS $$
BEGIN
    IF v_delivery_employee IS NOT NULL AND v_car IS NULL THEN
        RAISE EXCEPTION 'Поле Su_car должно быть заполнено, если поле Su_delivery_employee задано.';
    END IF;

    UPDATE Supplies
    SET 
        Su_from_employee = v_from_employee,
        Su_delivery_employee = v_delivery_employee,
        Su_apply_employee = v_apply_employee,
        Su_car = v_car,
        Su_date = v_date
    WHERE Su_id = v_su_id;
END;
$$ LANGUAGE plpgsql;

-- Добавление запчасти в поставке
CREATE OR REPLACE FUNCTION AddPartInSupply(
    v_part_id INT,
    v_supply_id INT,
    v_number INT
) RETURNS VOID AS $$
BEGIN
    INSERT INTO PartsInSupply (PSu_part, PSu_supply, PSu_number)
    VALUES (v_part_id, v_supply_id, v_number);
END;
$$ LANGUAGE plpgsql;

-- Изменение запчасти в поставке
CREATE OR REPLACE FUNCTION UpdatePartInSupply(
    v_psu_id INT,
    v_part_id INT,
    v_supply_id INT,
    v_number INT
) RETURNS VOID AS $$
BEGIN
    IF v_number <= 0 THEN
        RAISE EXCEPTION 'PSu_number должно быть больше нуля.';
    END IF;

    UPDATE PartsInSupply
    SET PSu_part = v_part_id,
        PSu_supply = v_supply_id,
        PSu_number = v_number
    WHERE PSu_id = v_psu_id;
END;
$$ LANGUAGE plpgsql;

-- Добавление и изменение запчасти на складе
CREATE OR REPLACE FUNCTION UpsertPartInStock(
    v_part_id INT,
    v_number INT
) RETURNS VOID AS $$
BEGIN
    IF v_number < 0 THEN
        RAISE EXCEPTION 'PSt_number должно быть не отрицательным.';
    END IF;

    -- Проверяем, существует ли запись с таким PSt_part
    IF EXISTS (SELECT 1 FROM PartsInStock WHERE PSt_part = v_part_id) THEN
        -- Если запись существует, обновляем PSt_number
        UPDATE PartsInStock
        SET PSt_number = v_number
        WHERE PSt_part = v_part_id;
    ELSE
        -- Если записи нет, добавляем новую запись
        INSERT INTO PartsInStock (PSt_part, PSt_number)
        VALUES (v_part_id, v_number);
    END IF;
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

