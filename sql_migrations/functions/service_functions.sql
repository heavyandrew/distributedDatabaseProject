-- Добавление информации о клиенте
CREATE OR REPLACE FUNCTION AddClient(
    p_branch_id INT,
    p_s_id INT,
    p_s_name VARCHAR,
    p_s_phone VARCHAR,
    p_s_email VARCHAR
) RETURNS VOID AS $$
BEGIN
    -- Увеличиваем счетчик для существующих клиентов с тем же email
    UPDATE Clients
    SET C_num_counter = C_num_counter + 1
    WHERE S_email = p_s_email;

    -- Вставляем новую запись о клиенте (если такой записи еще нет)
    INSERT INTO Clients (Branch_id, S_id, S_name, S_phone, S_email, C_num_counter)
    VALUES (p_branch_id, p_s_id, p_s_name, p_s_phone, p_s_email, COALESCE((SELECT C_num_counter FROM Clients WHERE S_email = p_s_email), -1) + 1)
    ON CONFLICT (Branch_id, S_id) DO NOTHING; -- Игнорируем вставку, если такая запись уже существует
END;
$$ LANGUAGE plpgsql;

-- Изменение информации о клиенте
CREATE OR REPLACE FUNCTION UpdateClient(
    p_branch_id INT,
    p_s_id INT,
    p_s_name VARCHAR,
    p_s_phone VARCHAR,
    p_s_email VARCHAR
) RETURNS VOID AS $$
BEGIN
    -- Увеличиваем счетчик для существующих клиентов с тем же email
    UPDATE Clients
    SET C_num_counter = C_num_counter + 1
    WHERE S_email = p_s_email;

    -- Обновляем информацию о клиенте
    UPDATE Clients
    SET S_name = p_s_name,
        S_phone = p_s_phone,
        S_email = p_s_email
    WHERE Branch_id = p_branch_id AND S_id = p_s_id;

END;
$$ LANGUAGE plpgsql;

-- Удаление клиента
CREATE OR REPLACE FUNCTION DeleteClient(
    p_branch_id INT,
    p_s_id INT
) RETURNS VOID AS $$
DECLARE
    v_email VARCHAR(50);
BEGIN
    -- Получаем email клиента, которого хотим удалить
    SELECT S_email INTO v_email
    FROM Clients
    WHERE Branch_id = p_branch_id AND S_id = p_s_id;

    IF v_email IS NOT NULL THEN
        -- Уменьшаем счетчик для существующих клиентов с тем же email, если C_num_counter > 0
        UPDATE Clients
        SET C_num_counter = CASE
            WHEN C_num_counter > 0 THEN C_num_counter - 1
            ELSE 0
        END
        WHERE S_email = v_email;

        -- Удаляем запись о клиенте
        DELETE FROM Clients
        WHERE Branch_id = p_branch_id AND S_id = p_s_id;
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Добавление заявки на поставку
CREATE OR REPLACE FUNCTION CreateSupplyRequest(
    p_branch_id INT,
    p_sr_id INT,
    p_sr_part INT,
    p_sr_number INT,
    p_sr_service INT
) RETURNS VOID AS $$
BEGIN
    INSERT INTO SupplyRequests (Branch_id, SR_id, SR_part, SR_number, SR_service, SR_created_at, SR_closed_at, SR_status)
    VALUES (p_branch_id, p_sr_id, p_sr_part, p_sr_number, p_sr_service, CURRENT_DATE, NULL, 1);
END;
$$ LANGUAGE plpgsql;

-- Вычисление итоговой цены
CREATE OR REPLACE PROCEDURE CalculateFinalPrice(v_order_id INT, v_branch_id INT) AS $$
DECLARE
    v_final_price DECIMAL(10, 2) := 0; 
BEGIN
    -- Ищем все записи в ServicesInOrders для данного заказа
    FOR service IN SELECT SO_service_id, SO_part FROM ServicesInOrders WHERE SO_order = v_order_id LOOP
        -- Если SO_service_id не NULL, добавляем цену услуги
        IF service.SO_service_id IS NOT NULL THEN
            SELECT S_price INTO v_final_price 
            FROM Services 
            WHERE S_id = service.SO_service_id;
            v_final_price := v_final_price + COALESCE(v_final_price, 0);
        END IF;

        -- Если SO_part не NULL, добавляем цену детали
        IF service.SO_part IS NOT NULL THEN
            SELECT MP_price INTO v_final_price 
            FROM PartsInService p 
            JOIN ModelsOfParts m ON p.PS_part_id = m.MP_id
            WHERE p.PS_service_id = service.SO_service_id AND p.PS_id = service.SO_part;
        v_final_price := v_final_price + COALESCE(v_final_price, 0);
        END IF;
    END LOOP;

    -- Обновляем поле O_final_price для указанного заказа
    UPDATE Orders 
    SET O_final_price = v_final_price 
    WHERE Branch_id = v_branch_id AND O_id = v_order_id;
END;
$$ LANGUAGE plpgsql;

-- Функция триггера
CREATE OR REPLACE FUNCTION CheckServiceEmployee() RETURNS TRIGGER AS $$
DECLARE
    v_service_id INT;
    v_employee_service_id INT;
    employee_name VARCHAR;
BEGIN
    -- Получаем E_service для сотрудника, указанного в заказе
    SELECT E_service, E_name || ' ' || E_lastname INTO v_employee_service_id, employee_name
    FROM Employees 
    WHERE E_id = (SELECT O_employee 
                  FROM Orders 
                  WHERE Branch_id = NEW.SO_service_id AND O_id = NEW.SO_order);

    -- Проверяем, что SO_service_id соответствует E_service
    IF NEW.SO_service_id <> v_employee_service_id THEN
        RAISE EXCEPTION 'SO_service_id % не соответствует E_service % для сотрудника %', 
                        NEW.SO_service_id, 
                        v_employee_service_id,
                        employee_name; 
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Создание триггера
CREATE TRIGGER trg_CheckServiceEmployee
BEFORE INSERT ON ServicesInOrders
FOR EACH ROW
EXECUTE PROCEDURE CheckServiceEmployee();
