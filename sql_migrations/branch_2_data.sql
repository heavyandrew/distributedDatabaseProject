BEGIN;
-- Клиенты
INSERT INTO Clients
    (Branch_id, S_id, S_name, S_phone, S_email, C_num_counter)
VALUES
    (3, 1, 'Иванов Петр Иванович',            '+7 (910) 123-45-67', 'iiivanov@example.com',     0),
    (3, 2, 'Петрова Анна Сергеевна',          '+7 (910) 234-56-78', 'aspetrova@example.com',    0),
    (3, 3, 'Сидоров Алексей Петрович',        '+7 (910) 345-67-89', 'apsidorov@example.com',    0),
    (3, 4, 'Кузнецова Светлана Вячеславовна', '+7 (910) 456-78-90', 'svkuznetsova@example.com', 0),
    (3, 5, 'Смирнов Сергей Николаевич',       '+7 (910) 567-89-01', 'sssmirnov@example.com',    0);

-- Устройства
INSERT INTO Devices
    (Branch_id, D_id, D_model, D_description)
VALUES
    (3, 1, 1, 'Серийный номер: NBX-4567-ABCD'),
    (3, 2, 4, 'Серийный номер: LAPTOP-1234-WXYZ'),
    (3, 3, 1, 'Серийный номер: NOT-8765-QWER'),
    (3, 4, 5, 'Серийный номер: COMP-4321-ASDF'),
    (3, 5, 7, 'Серийный номер: MOB-6543-QWER');

-- Запчасти в филиале
INSERT INTO PartsInService
    (PS_service_id, PS_id, PS_part_id, PS_number)
VALUES
    (3, 1, 1,  3),
    (3, 2, 2,  2),
    (3, 3, 3,  2),
    (3, 4, 4,  1),
    (3, 5, 5,  2),
    (3, 6, 6,  4),
    (3, 7, 7,  3),
    (3, 8, 8,  5),
    (3, 9, 9,  1),
    (3, 10,10, 1),
    (3, 11, 11, 1);

-- Заказы на ремонт
INSERT INTO Orders
    (Branch_id, O_id, O_client_id, O_status, O_employee, O_device, O_note, O_date, O_final_price)
VALUES
    (3, 1, 1, 4, 1, 1, 'Обновили процессор', '2022-10-05', 0),
    (3, 2, 2, 4, 1, 2, 'Поставили новую оперативу', '2022-11-06', 0),
    (3, 3, 3, 5, 1, 3, 'Почистили от пыли', '2022-12-07', 0),
    (3, 4, 4, 3, 1, 4, 'Вирус все фотки зашифровал, вроде смогли нужное восстановить', '2023-01-16', 0),
    (3, 5, 5, 2, 1, 5, 'Переустановили винду', '2022-02-02', 0);

-- Услуги в заказах
INSERT INTO ServicesInOrders
    (SO_service_id, SO_id, SO_part, SO_order)
VALUES
    (3, 1, 1, 1),
    (3, 2, 2, 2),
    (3, 3, NULL, 3),
    (3, 4, NULL, 4),
    (3, 5, NULL, 5);

-- Отзывы
INSERT INTO Reviews
    (Branch_id, R_id, R_order_id, R_score, R_text)
VALUES
    (3, 1, 1, 4, 'Мастер очень вежливый, цены также приятные. Однако делали долго'),
    (3, 2, 3, 5, 'Все понравилось, сервис на уровне. Ребята молодцы!'),
    (3, 3, 4, 4, 'Работу сделали быстро. Хотелось бы чтобы в помещении был кулер, чтобы можно было попить, пока ожидаешь мастера');

-- Заявки на поставку запчастей
INSERT INTO SupplyRequests
    (Branch_id, SR_id, SR_part, SR_number, SR_status, SR_service, SR_created_at, SR_closed_at)
VALUES
    (3, 1, 1, 1, 1, 4, '2022-09-30', '2022-10-11'),
    (3, 2, 2, 1, 1, 4, '2022-09-29', '2022-10-11'),
    (3, 3, 3, 1, 1, 4, '2022-11-20', '2022-12-01'),
    (3, 4, 4, 1, 1, 4, '2022-11-21', '2022-12-01');

-- Накладные
INSERT INTO Supplies
    (Su_from_employee, Su_id, Su_delivery_employee, Su_apply_employee, Su_car, Su_date)
VALUES
    (5, 2, 6, 1, 'С064КА977', '2022-10-11'),
    (5, 3, 6, 2, 'С784КА977', '2022-12-01');

-- Запчасти в накладной
INSERT INTO PartsInSupply
    (PSu_id, PSu_part, PSu_supply, PSu_number)
VALUES
    (2, 1, 2, 1),
    (3, 2, 2, 2),
    (4, 3, 3, 3),
    (5, 4, 3, 2);

COMMIT;
