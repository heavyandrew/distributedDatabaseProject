-- 1. Функции для работы с филиалами (Branches)

-- Добавление филиала
CREATE OR REPLACE FUNCTION AddBranch(branch_address VARCHAR, opening_date DATE, closing_date DATE)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Branches (S_address, S_opening_date, S_closing_date) 
    VALUES (branch_address, opening_date, closing_date);
END;
$$ LANGUAGE plpgsql;

-- Изменение филиала
CREATE OR REPLACE FUNCTION UpdateBranch(branch_id INT, branch_address VARCHAR, opening_date DATE, closing_date DATE)
RETURNS VOID AS $$
BEGIN
    UPDATE Branches 
    SET S_address = branch_address, S_opening_date = opening_date, S_closing_date = closing_date 
    WHERE S_id = branch_id;
END;
$$ LANGUAGE plpgsql;

-- Удаление филиала
CREATE OR REPLACE FUNCTION DeleteBranch(branch_id INT)
RETURNS VOID AS $$
BEGIN
    DELETE FROM Branches WHERE S_id = branch_id;
END;
$$ LANGUAGE plpgsql;


-- 2. Функции для работы со статусами заказов (OrderStatuses)

-- Добавление статуса заказа
CREATE OR REPLACE FUNCTION AddOrderStatus(status VARCHAR)
RETURNS VOID AS $$
BEGIN
    INSERT INTO OrderStatuses (OS_status) VALUES (status);
END;
$$ LANGUAGE plpgsql;

-- Изменение статуса заказа
CREATE OR REPLACE FUNCTION UpdateOrderStatus(status_id INT, status VARCHAR)
RETURNS VOID AS $$
BEGIN
    UPDATE OrderStatuses 
    SET OS_status = status 
    WHERE OS_id = status_id;
END;
$$ LANGUAGE plpgsql;

-- Удаление статуса заказа
CREATE OR REPLACE FUNCTION DeleteOrderStatus(status_id INT)
RETURNS VOID AS $$
BEGIN
    DELETE FROM OrderStatuses WHERE OS_id = status_id;
END;
$$ LANGUAGE plpgsql;

-- 3. Функции для работы с услугами (Services)

-- Добавление услуги
CREATE OR REPLACE FUNCTION AddService(service_name VARCHAR, service_description VARCHAR, service_price DECIMAL)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Services (S_name, S_description, S_price) 
    VALUES (service_name, service_description, service_price);
END;
$$ LANGUAGE plpgsql;

-- Изменение услуги
CREATE OR REPLACE FUNCTION UpdateService(service_id INT, service_name VARCHAR, service_description VARCHAR, service_price DECIMAL)
RETURNS VOID AS $$
BEGIN
    UPDATE Services 
    SET S_name = service_name, S_description = service_description, S_price = service_price 
    WHERE S_id = service_id;
END;
$$ LANGUAGE plpgsql;

-- Удаление услуги
CREATE OR REPLACE FUNCTION DeleteService(service_id INT)
RETURNS VOID AS $$
BEGIN
    DELETE FROM Services WHERE S_id = service_id;
END;
$$ LANGUAGE plpgsql;