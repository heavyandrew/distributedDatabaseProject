-- Получить список всех клиентов с их именами и номерами телефонов
SELECT S_id, S_name, S_phone
FROM Clients;

-- Получить список всех услуг с их описанием и ценами, отсортированных по цене (по убыванию)
SELECT S_id, S_name, S_description, S_price
FROM Services
ORDER BY S_price DESC;

-- Получить список всех доступных статусов заказов
SELECT OS_id, OS_status
FROM OrderStatuses;


-- Получить информацию о всех устройствах, включая их модель и описание
SELECT D_id, D_model, D_description
FROM Devices;

-- Найти все типы устройств, представленные в таблице DeviceTypes
SELECT DT_id, DT_name
FROM DeviceTypes;

-- Получить список всех клиентов, у которых больше 5 заказов (по C_num_counter)
SELECT S_id, S_name, S_phone, C_num_counter
FROM Clients
WHERE C_num_counter > 5;

-- Получить все модели и их соответствующие бренды и типы (с использованием соединений)
SELECT M.M_id, M.M_name, DT.DT_name AS DeviceType, DB.DB_name AS BrandName
FROM Models M
JOIN DeviceTypes DT ON M.M_type = DT.DT_id
LEFT JOIN DeviceBrands DB ON M.M_brand = DB.DB_id;

-- Посчитать общее количество устройств по каждому типу модели
SELECT M_type, COUNT(D_id) AS DeviceCount
FROM Devices D
JOIN Models M ON D.D_model = M.M_id
GROUP BY M_type;

-- Получить список всех позиций, отсортированных по названию
SELECT P_id, P_name
FROM Positions
ORDER BY P_name;
