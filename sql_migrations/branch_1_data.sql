-- Заказы на ремонт
-- Услуги в заказах
-- Клиенты
-- Устройства
-- Запчасти в филиале
-- Заявки на поставку запчастей
-- Накладные
-- Отзывы

BEGIN;

-- Запчасти в филиале
INSERT INTO PartsInService
    (PS_service_id, PS_id, PS_part_id, PS_number)
VALUES
    (2, 1, 5, 9),
    (2, 2, 1, 8),
    (2, 3, 2, 7),
    (2, 4, 4, 6);

-- Устройства
INSERT INTO Devices
    (Branch_id, D_id, D_model, D_description)
VALUES
    (2, 1, 1, 'Macbook Air'),
    (2, 2, 2, 'Macbook Pro'),
    (2, 3, 3, 'XPS 13'),
    (2, 4, 11, 'PC детский'),
    (2, 5, 11, 'PC для работы'),
    (2, 6, 11, 'PC игровой'),
    (2, 7, 11, 'PC без матери');

-- Клиенты
INSERT INTO Clients
    (Branch_id, S_id, S_name, S_phone, S_email, C_num_counter)
VALUES
(2, 1, 'Иван Иванов', '+7 123 456-78-90', 'ivan.ivanov@example.com', 1),
(2, 2, 'Анна Петрова', '+7 234 567-89-01', 'anna.petrova@example.com', 2),
(2, 3, 'Сергей Смирнов', '+7 345 678-90-12', 'sergey.smirnov@example.com', 3),
(2, 4, 'Мария Кузнецова', '+7 456 789-01-23', 'maria.kuznetsova@example.com', 4),
(2, 5, 'Дмитрий Попов', '+7 567 890-12-34', 'dmitry.popov@example.com', 5),
(2, 6, 'Елена Васильева', '+7 678 901-23-45', 'elena.vasilieva@example.com', 6);

-- Заказы на ремонт
INSERT INTO Orders
    (Branch_id, O_id, O_client_id, O_status, O_employee, O_device, O_note, O_date, O_final_price)
VALUES
    (2, 1, 1, 1, 4, 1, 'Облили, минус мать', '2024-11-10', 3450), --4 pc 10 laptop
    (2, 2, 2, 2, 4, 2, 'Греется', '2024-11-10', 1450),
    (2, 3, 3, 2, 4, 3, 'Сломан жесткий диск', '2024-11-10', 5574),
    (2, 4, 4, 3, 4, 2, 'такой же девайс уже был, много пыли', '2024-11-11', 1450),
    (2, 5, 5, 3, 10, 4, 'Нужна новая видеокарта', '2024-11-11', 53149),
    (2, 6, 6, 4, 10, 5, 'Много пыли', '2024-11-12', 1450),
    (2, 7, 1, 4, 10, 6, 'Восстановление удаленных фото анапа 2013', '2024-11-12', 1450),
    (2, 8, 1, 5, 10, 7, 'Мать мертвая', '2024-11-13', 1800);

-- Отзывы
INSERT INTO Reviews
    (Branch_id, R_id, R_ORDER_ID, R_SCORE, R_TEXT)
VALUES
    (2, 1, 3, 4, 'От пыли почистили, но теперь везде следы от щетки, а еще и всю термопасту зачем-то срезали'),
    (2, 2, 5, 5, 'Огромное спасибо за восстановление фотографий со свадьбы тёти Наташи из Анапы в 2013 году');


-- Услуги в заказах
INSERT INTO ServicesInOrders
    (SO_service_id, SO_id, SO_part, SO_order)
VALUES
    (2, 1, NULL, 1), --первый заказ
    (2, 2, NULL, 1), --первый заказ
    (2, 3, NULL, 2),
    (2, 4, 4, 3),
    (2, 5, NULL, 4),
    (2, 6, 3, 5),
    (2, 7, NULL, 6),
    (2, 8, NULL, 7),
    (2, 9, NULL, 8);


-- Заявки на поставку --zap4act nomer 3
INSERT INTO SupplyRequests 
    (Branch_id, SR_id, SR_part, SR_number, SR_service, SR_created_at, SR_closed_at, SR_status)
VALUES
    (2, 1, 3, 1, 2, '2024-11-11', '2024-11-12', 4);

-- Накладные
INSERT INTO Supplies 
    (Su_id, Su_from_employee, Su_delivery_employee, Su_apply_employee, Su_car, Su_date)
VALUES
    (1, 10, 6, 4, 'А228УЕ777', '2024-11-12');

-- Запчасти в накладной
INSERT INTO PartsInSupply
    (PSu_id, PSu_part, PSu_supply, PSu_number)
VALUES
    (1,1, 1, 1);

COMMIT;