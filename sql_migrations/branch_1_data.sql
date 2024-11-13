-- Заказы на ремонт
-- Услуги в заказах
-- Клиенты
-- Устройства
-- Запчасти в филиале
-- Заявки на поставку запчастей
-- Накладные
-- Отзывы

BEGIN;

-- Заказы на ремонт
INSERT INTO Orders
    (O_client_id, O_status, O_employee, O_device, O_note, O_date, O_final_price)
VALUES
    (1, 1, 4, 1, 'Облили, минус мать', '2024-11-10', 3450), --4 pc 10 laptop
    (2, 2, 4, 2, 'Греется', '2024-11-10', 1450),
    (3, 2, 4, 3, 'Сломан жесткий диск', '2024-11-10', 5574), 
    (4, 3, 4, 2, 'такой же девайс уже был, много пыли', '2024-11-11', 1450),
    (5, 3, 10, 4, 'Нужна новая видеокарта', '2024-11-11', 53149), 
    (6, 4, 10, 5, 'Много пыли', '2024-11-12', 1450);
    (1, 4, 10, 6, 'Восстановление удаленных фото анапа 2013', '2024-11-12', 1450);
    (1, 5, 10, 7, 'Мать мертвая', '2024-11-13', 1800);


-- Услуги в заказах
INSERT INTO ServicesInOrders
    (SO_service_id, SO_part, SO_order)
VALUES
    (8, NULL, 1), --первый заказ
    (5, NULL, 1), --первый заказ
    (2, NULL, 2),
    (6, 4, 3),
    (2, NULL, 4),
    (7, 3, 5),
    (2, NULL, 6),
    (4, NULL, 7),
    (5, NULL, 8),

-- Клиенты
INSERT INTO Clients 
    (S_name, S_phone, S_email, C_num_counter) 
VALUES
('Иван Иванов', '+7 123 456-78-90', 'ivan.ivanov@example.com', 1),
('Анна Петрова', '+7 234 567-89-01', 'anna.petrova@example.com', 2),
('Сергей Смирнов', '+7 345 678-90-12', 'sergey.smirnov@example.com', 3),
('Мария Кузнецова', '+7 456 789-01-23', 'maria.kuznetsova@example.com', 4),
('Дмитрий Попов', '+7 567 890-12-34', 'dmitry.popov@example.com', 5),
('Елена Васильева', '+7 678 901-23-45', 'elena.vasilieva@example.com', 6),

-- Устройства
INSERT INTO Devices 
    (D_model, D_description) 
VALUES
    (1, 'Macbook Air'),
    (2, 'Macbook Pro'),
    (3, 'XPS 13'),
    (11, 'PC детский'),
    (11, 'PC для работы'),
    (11, 'PC игровой'),
    (11, 'PC без матери'),

-- Запчасти в филиале
INSERT INTO PartsInService 
    (PS_service_id, PS_part_id) 
VALUES
    (2, 5),
    (2, 1),
    (2, 2),
    (2, 4),


-- Заявки на поставку --zap4act nomer 3
INSERT INTO SupplyRequests 
    (SR_part, SR_number, SR_service, SR_created_at, SR_closed_at, SR_status) 
VALUES
    (3, 1, 2, '2024-11-11', '2024-11-12', 4),

-- Накладные
INSERT INTO Supplies 
    (Su_from_employee, Su_delivery_employee, Su_apply_employee, Su_car, Su_date) 
VALUES
    (10, 6, 4, 'А228УЕ777', '2024-11-12')


-- Отзывы 
INSERT INTO Devices 
    (R_order_id, R_score, R_text) 
VALUES
    (6, 3, 'От пыли почистили, но теперь везде следы от щетки, а еще и всю термопасту зачем-то срезали'),
    (7, 5, 'Огромное спасибо за восстановление фотографий со свадьбы тёти Наташи из Анапы в 2013 году'),


COMMIT;