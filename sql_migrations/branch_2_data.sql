BEGIN;
-- Клиенты
INSERT INTO Clients
    (S_name, S_phone, S_email, C_num_counter)
VALUES
    ('Иванов Петр Иванович',            '+7 (910) 123-45-67', 'iiivanov@example.com',     0),
    ('Петрова Анна Сергеевна',          '+7 (910) 234-56-78', 'aspetrova@example.com',    0),
    ('Сидоров Алексей Петрович',        '+7 (910) 345-67-89', 'apsidorov@example.com',    0),
    ('Кузнецова Светлана Вячеславовна', '+7 (910) 456-78-90', 'svkuznetsova@example.com', 0),
    ('Смирнов Сергей Николаевич',       '+7 (910) 567-89-01', 'sssmirnov@example.com',    0);

-- Устройства
INSERT INTO Devices
    (D_model, D_description)
VALUES
    (1, 'Серийный номер: NBX-4567-ABCD'),
    (4, 'Серийный номер: LAPTOP-1234-WXYZ'),
    (1, 'Серийный номер: NOT-8765-QWER'),
    (5, 'Серийный номер: COMP-4321-ASDF'),
    (6, 'Серийный номер: NB-9876-ZXCV'),
    (6, 'Серийный номер: LNT-5432-POIU'),
    (7, 'Серийный номер: LAP-3210-MNBV'),
    (7, 'Серийный номер: MOB-6543-QWER');

-- Запчасти в филиале
INSERT INTO PartsInService
    (PS_service_id, PS_part_id, PS_number)
VALUES
    (4, 1,  3), 
    (4, 2,  2), 
    (4, 3,  2), 
    (4, 4,  1), 
    (4, 5,  2), 
    (4, 6,  4), 
    (4, 7,  3), 
    (4, 8,  5), 
    (4, 9,  1), 
    (4, 10, 1),
    (4, 11, 1); 

-- Заказы на ремонт
INSERT INTO Orders
    (O_client_id, O_status, O_employee, O_device, O_note, O_date, O_final_price)
VALUES
    (1, 4, 1, 1, 'Обновили процессор', '2022-10-05', 0),
    (2, 4, 1, 2, 'Поставили новую оперативу', '2022-11-06', 0),
    (3, 5, 1, 3, 'Почистили от пыли', '2022-12-07', 0),
    (4, 3, 1, 4, 'Вирус все фотки зашифровал, вроде смогли нужное восстановить', '2023-01-16', 0),
    (5, 2, 1, 5, 'Переустановили винду', '2022-02-02', 0);

-- Услуги в заказах
INSERT INTO ServicesInOrders
    (SO_service_id, SO_part, SO_order)
VALUES
    (7, 1, 1),
    (6, 2, 2),
    (2, NULL, 3),
    (4, NULL, 4),
    (8, NULL, 5);

-- Отзывы
INSERT INTO Reviews
    (R_order_id, R_score, R_text)
VALUES
    (1, 4, 'Мастер очень вежливый, цены также приятные. Однако делали долго'),
    (3, 5, 'Все понравилось, сервис на уровне. Ребята молодцы!'),
    (4, 4, 'Работу сделали быстро. Хотелось бы чтобы в помещении был кулер, чтобы можно было попить, пока ожидаешь мастера');

-- Заявки на поставку запчастей
INSERT INTO SupplyRequests
    (SR_part, SR_number, SR_status, SR_service, SR_created_at, SR_closed_at)
VALUES
    (1, 1, 1, 4, '2022-09-30', '2022-10-11'),
    (2, 1, 1, 4, '2022-09-29', '2022-10-11'),
    (3, 1, 1, 4, '2022-11-20', '2022-12-01'),
    (4, 1, 1, 4, '2022-11-21', '2022-12-01');

-- Накладные
INSERT INTO Supplies
    (Su_from_employee, Su_delivery_employee, Su_apply_employee, Su_car, Su_date)
VALUES
    (5, 6, 1, 'С064КА977', '2022-10-11'),
    (5, 6, 2, 'С784КА977', '2022-12-01'),
    (6, 5, 1, 'С069ММ977', '2023-01-12');

-- Запчасти в накладной
INSERT INTO PartsInSupply
    (PSu_part, PSu_supply, PSu_number)
VALUES
    (1, 1, 1),
    (2, 1, 2),
    (3, 2, 3),
    (4, 2, 2);

COMMIT;
