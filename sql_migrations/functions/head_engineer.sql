-- 1. Функции для работы с типами устройств (DeviceTypes)

-- Добавление типа устройства
CREATE OR REPLACE FUNCTION AddDeviceType(type_name VARCHAR)
RETURNS VOID AS $$
BEGIN
    INSERT INTO DeviceTypes (DT_name) VALUES (type_name);
END;
$$ LANGUAGE plpgsql;

-- Изменение типа устройства
CREATE OR REPLACE FUNCTION UpdateDeviceType(type_id INT, type_name VARCHAR)
RETURNS VOID AS $$
BEGIN
    UPDATE DeviceTypes
    SET DT_name = type_name
    WHERE DT_id = type_id;
END;
$$ LANGUAGE plpgsql;

-- Удаление типа устройства
CREATE OR REPLACE FUNCTION DeleteDeviceType(type_id INT)
RETURNS VOID AS $$
BEGIN
    DELETE FROM DeviceTypes WHERE DT_id = type_id;
END;
$$ LANGUAGE plpgsql;


-- 2. Функции для работы с типами запчастей (PartTypes)

-- Добавление типа запчасти
CREATE OR REPLACE FUNCTION AddPartType(part_name VARCHAR, part_description VARCHAR)
RETURNS VOID AS $$
BEGIN
    INSERT INTO PartTypes (PT_name, PT_description) VALUES (part_name, part_description);
END;
$$ LANGUAGE plpgsql;

-- Изменение типа запчасти
CREATE OR REPLACE FUNCTION UpdatePartType(part_id INT, part_name VARCHAR, part_description VARCHAR)
RETURNS VOID AS $$
BEGIN
    UPDATE PartTypes
    SET PT_name = part_name, PT_description = part_description
    WHERE PT_id = part_id;
END;
$$ LANGUAGE plpgsql;

-- Удаление типа запчасти
CREATE OR REPLACE FUNCTION DeletePartType(part_id INT)
RETURNS VOID AS $$
BEGIN
    DELETE FROM PartTypes WHERE PT_id = part_id;
END;
$$ LANGUAGE plpgsql;


-- 3. Функции для работы с моделями устройств (Models)

-- Добавление модели устройства
CREATE OR REPLACE FUNCTION AddModel(device_type INT, brand INT, model_name VARCHAR, model_description VARCHAR)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Models (M_type, M_brand, M_name, M_description)
    VALUES (device_type, brand, model_name, model_description);
END;
$$ LANGUAGE plpgsql;

-- Изменение модели устройства
CREATE OR REPLACE FUNCTION UpdateModel(model_id INT, device_type INT, brand INT, model_name VARCHAR, model_description VARCHAR)
RETURNS VOID AS $$
BEGIN
    UPDATE Models
    SET M_type = device_type, M_brand = brand, M_name = model_name, M_description = model_description
    WHERE M_id = model_id;
END;
$$ LANGUAGE plpgsql;

-- Удаление модели устройства
CREATE OR REPLACE FUNCTION DeleteModel(model_id INT)
RETURNS VOID AS $$
BEGIN
    DELETE FROM Models WHERE M_id = model_id;
END;
$$ LANGUAGE plpgsql;


-- 4. Функции для работы с моделями запчастей (ModelsOfParts)

-- Добавление модели запчасти
CREATE OR REPLACE FUNCTION AddPartModel(part_type_id INT, part_name VARCHAR, brand INT, price DECIMAL(8, 2), description VARCHAR)
RETURNS VOID AS $$
BEGIN
    INSERT INTO ModelsOfParts (MP_type_id, MP_name, MP_brand, MP_price, MP_description)
    VALUES (part_type_id, part_name, brand, price, description);
END;
$$ LANGUAGE plpgsql;

-- Изменение модели запчасти
CREATE OR REPLACE FUNCTION UpdatePartModel(part_model_id INT, part_type_id INT, part_name VARCHAR, brand INT, price DECIMAL(8, 2), description VARCHAR)
RETURNS VOID AS $$
BEGIN
    UPDATE ModelsOfParts
    SET MP_type_id = part_type_id, MP_name = part_name, MP_brand = brand, MP_price = price, MP_description = description
    WHERE MP_id = part_model_id;
END;
$$ LANGUAGE plpgsql;

-- Удаление модели запчасти
CREATE OR REPLACE FUNCTION DeletePartModel(part_model_id INT)
RETURNS VOID AS $$
BEGIN
    DELETE FROM ModelsOfParts WHERE MP_id = part_model_id;
END;
$$ LANGUAGE plpgsql;


-- 5. Функции для работы с услугами (Services)

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
