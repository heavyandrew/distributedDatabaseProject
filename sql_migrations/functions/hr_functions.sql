-- Добавление должности
CREATE OR REPLACE FUNCTION AddPosition(new_position VARCHAR)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Positions (P_name) VALUES (new_position);
END;
$$ LANGUAGE plpgsql;

-- Изменение должности
CREATE OR REPLACE FUNCTION UpdatePosition(pos_id INT, new_position VARCHAR)
RETURNS VOID AS $$
BEGIN
    UPDATE Positions
    SET P_name = new_position
    WHERE P_id = pos_id;
END;
$$ LANGUAGE plpgsql;

-- Удаление должности
CREATE OR REPLACE FUNCTION DeletePosition(pos_id INT)
RETURNS VOID AS $$
BEGIN
    DELETE FROM Positions
    WHERE P_id = pos_id;
END;
$$ LANGUAGE plpgsql;

-- Добавление сотрудника
CREATE OR REPLACE FUNCTION AddEmployee(
    lastname VARCHAR(30),
    name VARCHAR(30),
    patronymic VARCHAR(30),
    phone VARCHAR(20),
    email VARCHAR(50),
    post INT,
    service INT,
    hiring_date DATE DEFAULT CURRENT_DATE
) 
RETURNS VOID AS $$
BEGIN
    INSERT INTO Employees (
        E_lastname,
        E_name,
        E_patronymic,
        E_phone,
        E_email,
        E_post,
        E_service,
        E_hiring_date,
        E_quit_date
    ) VALUES (
        lastname,
        name,
        patronymic,
        phone,
        email,
        post,
        service,
        hiring_date,
        NULL
    );
END;
$$ LANGUAGE plpgsql;

-- Изменение сотрудника
CREATE OR REPLACE FUNCTION UpdateEmployee(
    emp_id INT,
    lastname VARCHAR(30),
    name VARCHAR(30),
    patronymic VARCHAR(30),
    phone VARCHAR(20),
    email VARCHAR(50),
    post INT,
    service INT,
    hiring_date DATE,
    quit_date DATE
) 
RETURNS VOID AS $$
BEGIN
    UPDATE Employees
    SET 
        E_lastname = lastname,
        E_name = name,
        E_patronymic = patronymic,
        E_phone = phone,
        E_email = email,
        E_post = post,
        E_service = service,
        E_hiring_date = hiring_date,
        E_quit_date = quit_date
    WHERE E_id = emp_id;
END;
$$ LANGUAGE plpgsql;

-- Увольнение сотрудника
CREATE OR REPLACE FUNCTION TerminateEmployee(emp_id INT, quit_date DATE DEFAULT CURRENT_DATE)
RETURNS VOID AS $$
BEGIN
    UPDATE Employees
    SET E_quit_date = quit_date
    WHERE E_id = emp_id;
END;
$$ LANGUAGE plpgsql;

-- Удаление сотрудника
CREATE OR REPLACE FUNCTION DeleteEmployee(emp_id INT) 
RETURNS VOID AS $$
BEGIN
    DELETE FROM Employees
    WHERE E_id = emp_id;
END;
$$ LANGUAGE plpgsql;
