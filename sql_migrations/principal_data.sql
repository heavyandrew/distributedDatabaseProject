BEGIN;

-- Статусы заказов
INSERT INTO OrderStatuses
    (OS_status) 
VALUES
    ('Создан'),
    ('Принят'),
    ('В процессе'),
    ('Выполнен'),
    ('Отклонен');

-- Статусы заявок
INSERT INTO RequestStatuses
    (RS_name)
VALUES
    ('Создана'),
    ('Принята'),
    ('В процессе'),
    ('Выполнена'),
    ('Отклонена');

-- Типы устройств
INSERT INTO DeviceTypes
    (DT_name)
VALUES
    ('Ноутбук'),
    ('ПК'),
    ('Моноблок'); 

-- Бренды устройств
INSERT INTO DeviceBrands
    (DB_name, DB_description)
VALUES
    ('Apple',     'Известный американский производитель потребительской электроники и программного обеспечения, знаменитый своими ноутбуками MacBook и настольными компьютерами iMac.'),
    ('Dell',      'Американская компания, специализирующаяся на производстве персональных компьютеров, серверов, сетевого оборудования и других технологий.'),
    ('HP',        'Hewlett-Packard — один из крупнейших мировых производителей ПК, ноутбуков и принтеров, предлагающий широкий ассортимент продукции для дома и бизнеса.'),
    ('Lenovo',    'Китайская компания, известная своей продукцией в сфере ПК и ноутбуков, включая популярные линии ThinkPad и IdeaPad.'),
    ('Asus',      'Тайваньский производитель, предлагающий широкий выбор ноутбуков, материнских плат, видеокарт и другой компьютерной техники.'),
    ('Acer',      'Компания, специализирующаяся на производстве ПК, ноутбуков и аксессуаров, выделяющаяся конкурентоспособными ценами.'),
    ('Microsoft', 'Амиканская технологическая компания, известная разработкой операционной системы Windows и производством устройств Surface.'),
    ('Samsung',   'Корейский многопрофильный конгломерат, производящий различные электронные устройства, включая ноутбуки и ПК с операционной системой Windows.');; 

-- Модели устройств
INSERT INTO Models
    (M_type, M_brand, M_name, M_description)
VALUES
    (1, 1,    'MacBook Air',        'Ультратонкий и легкий ноутбук от Apple, идеально подходящий для повседневных задач и работы в интернете.'),
    (1, 1,    'MacBook Pro',        'Мощный ноутбук от Apple с Retina дисплеем, предназначенный для профессионалов и творческих задач.'),
    (1, 2,    'XPS 13',             'Компактный и мощный ноутбук от Dell с высоким качеством сборки и дисплея, идеальный для путешествий.'),
    (1, 2,    'Inspiron 15',        'Универсальный ноутбук от Dell с отличным соотношением цена-качество для работы и развлечений.'),
    (1, 3,    'Pavilion 15',        'Ноутбук от HP с хорошей производительностью и качественным экраном, подойдет для учебы и работы.'),
    (1, 3,    'Omen 15',            'Игровой ноутбук от HP с мощным железом и широкими возможностями для геймеров.'),
    (1, 4,    'ThinkPad X1 Carbon', 'Легкий и прочный бизнес-ноутбук от Lenovo с отличной клавиатурой и длительным временем работы от батареи.'),
    (1, 4,    'IdeaPad 5',          'Ноутбук от Lenovo с хорошей производительностью и современным дизайном, отлично подходит для студентов.'),
    (1, 5,    'ROG Zephyrus G14',   'Игровой ноутбук от Asus, обладающий высокой производительностью и компактными размерами.'),
    (1, 5,    'ZenBook 13',         'Супертонкий и стильный ноутбук от Asus, отлично подходящий для работы и развлечений на ходу.');
    (2, NULL, 'PC',                 'Персональный компьютер');

-- Филиалы
INSERT INTO Branches
    (S_address, S_opening_date, S_closing_date) 
VALUES
    ('ул. Пушкина, д. Колотушкина', '2022-09-05', NULL); 
    ('ул. Чехова, д. 8, ст. 1',     '2021-03-20', NULL); 
    ('Ленинский проезд, д. 11',     '2021-08-17', '2022-04-09');
    ('Центральная площадь, д. 1',   '2021-09-01', NULL),
    ('просп. Иванова, д. 32',       '2020-12-01', '2021-11-28'); 

-- Сотрудники
INSERT INTO Employees
    (E_lastname, E_name, E_patronymic, E_phone, E_email, E_post, E_service, E_hiring_date, E_quit_date)
VALUES
    ('Иванов',   'Иван',       'Иванович',    '89991234567', 'ivan.ivanov@example.com',         1, 4, '2021-09-22', NULL),
    ('Петров',   'Петр',       'Петрович',    '89998765432', 'petr.petrov@example.com',         4, 1, '2021-09-30', NULL),
    ('Сидоров',  'Сидор',      'Сидорович',   '89995551234', 'sidor.sidorov@example.com',       2, 4, '2021-09-02', '2023-08-20'),
    ('Кузнецов', 'Алексей',    'Алексеевич',  '89993334455', 'alexey.kuznetsov@example.com',    2, 2, '2022-02-24', NULL),
    ('Семёнов',  'Анатолий',   'Анатольевич', '89992223344', 'anatoly.semenov@example.com',     3, 1, '2021-09-02', NULL),
    ('Егорова',  'Мария',      'Николаевна',  '89991112233', 'maria.egorova@example.com',       3, 1, '2021-10-02', NULL),
    ('Фёдорова', 'Юлия',       'Дмитриевна',  '89990001122', 'yuliia.fyodorova@example.com',    5, 1, '2022-06-11', '2022-12-01'),
    ('Антонова', 'Мария',      'Сергеевна',   '89990001122', 'maria.antn@example.com',          5, 1, '2023-01-29', NULL),
    ('Зайцев',   'Сергей',     'Сергеевич',   '89981114455', 'sergey.zaytsev@example.com',      1, 3, '2021-11-09', NULL),
    ('Лебедев',  'Константин', 'Игоревич',    '89985552211', 'konstantin.lebedyev@example.com', 7, 1, '2021-08-15', NULL),
    ('Тихонов',  'Олег',       'Семёнович',   '89989998888', 'oleg.tikhonov@example.com',       1, 3, '2021-09-05', NULL);

-- Типы запчастей
INSERT INTO PartTypes
    (PT_name, PT_description)
VALUES
    ('Процессор',                      'Основной вычислительный компонент компьютеров, отвечающий за выполнение инструкций и обработку данных.'),
    ('Материнская плата',              'Основная платформа, на которую устанавливаются все другие компоненты системы, включая процессор, оперативную память и устройства хранения.'),
    ('Оперативная память (RAM)',       'Временное хранилище данных, используемое для хранения информации, к которой процессор обращается во время работы.'),
    ('Видеокарта',                     'Компонент, отвечающий за обработку и вывод графики на экран, важный для игр и графических приложений.'),
    ('Жесткий диск (HDD)',             'Устройство для постоянного хранения данных, использующее магнитные диски для записи информации.'),
    ('Твердотельный накопитель (SSD)', 'Тип устройства хранения данных, использующий флеш-память, обеспечивающий высокую скорость чтения и записи.'),
    ('Блок питания',                   'Устройство, обеспечивающее питание всех компонентов ПК, преобразующее сетевое напряжение в необходимое для работы частей системы.'),
    ('Система охлаждения',             'Устройства, предназначенные для отвода тепла от компонентов компьютера, обеспечивающие стабильную работу и предотвращающие перегрев.'),
    ('Корпус',                         'Защитная оболочка для компонентов ПК, обеспечивающая их монтаж и защиту от внешних воздействий.'),
    ('Оптический привод',              'Устройство для чтения и записи данных на оптические диски, такие как CD, DVD и Blu-ray.');

-- Бренды запчастей
INSERT INTO PartsBrands
    (PB_name, PB_description)
VALUES
    ('NVIDIA',          'Один из ведущих производителей графических процессоров и видеокарт, известных своими решениями для игр и профессиональных приложений.'),
    ('AMD',             'Компания, специализирующаяся на производстве процессоров и графических карт, предлагающая конкурентоспособные решения для десктопов и ноутбуков.'),
    ('Intel',           'Один из крупнейших мировых производителей полупроводников, известный своими процессорами, используемыми в большинстве персональных компьютеров.'),
    ('Corsair',         'Поставщик высококачественных компонентов и аксессуаров для ПК, включая памяти, блоки питания и системы охлаждения.'),
    ('Seagate',         'Один из ведущих производителей жестких дисков и накопителей SSD, предлагающий широкий ассортимент решений для хранения данных.'),
    ('Western Digital', 'Производитель жестких дисков и SSD, известный своими решениями для хранения и обработки данных для домашних и бизнес-пользователей.'),
    ('Thermalright',    'Производитель систем охлаждения для ПК, предоставляющий широкий выбор кулеров и радиаторов для процессоров и видеокарт.'),
    ('MSI',             'Компания, выпускающая не только материнские платы и видеокарты, но и другие комплектующие и устройства для геймеров и энтузиастов.'),
    ('Logitech',        'Известный производитель периферийных устройств, включая мыши, клавиатуры и веб-камеры для ПК и ноутбуков.'); 

-- Услуги
INSERT INTO Services
    (S_name, S_description, S_price)
VALUES
    ('Замена матрицы',            'Замена матрицы ноутбука, замена тачскрина, сенсорного стекла, лампы подсветки, шлейфа матрицы',        950),
    ('Чистка от пыли',            'Чистка системы охлаждения ноутбука от пыли с полной разборкой ноутбука, чистка ПК от пыли',            1450),
    ('Установка Windows',         'Предустановка операционной системы Windows на ПК или ноутбук, активация ОС Windows на ПК или ноутбук', 650),
    ('Восстановление данных',     'Восстановление и извлечение данных при неисправностях жесткого диска',                                 1450),
    ('Ремонт материнской платы',  'Ремонт материнской платы в ноутбуке, замена материнской платы, замена разъемов, мостов (сервер, юг)',  1800),
    ('Модернизация ноутбука',     'Замена дискретной видеокарты, установка/замена ЦП, модулей ОП, HDD, SSD или M.2 накопителей',          750),
    ('Модернизация ПК',           'Замена видеокарты, установка/замена ЦП, модулей ОП, HDD, SSD или M.2 накопителей',                     650),
    ('Ремонт залитого ноутбука',  'Химическая чистка ноутбука после залития, ремонт залитого ноутбука',                                   1650),

-- Должности
INSERT INTO Positions
    (P_name)
VALUES 
    ('Инженер по ремонту ноутбуков'),
    ('Инженер по ремонту ПК'),
    ('Работник склада'),
    ('Менеджер по обслуживанию клиентов'),
    ('Менеджер по работе с персоналом'),
    ('Руководитель склада');

-- Модели запчастей 
INSERT INTO ModelsOfParts
    (MP_type_id, MP_name, MP_brand, MP_price, MP_description)
VALUES
    (1, 'Core i7-11700K',                      3, 26249.25, 'Процессор с 8 ядрами и тактовой частотой до 5.0 ГГц, обеспечивающий высокую производительность для игр и работы.'),
    (3, 'Vengeance LPX 16GB',                  4, 5999.25,  'Оперативная память DDR4 с тактовой частотой 3200 МГц, идеальная для геймеров и сборок средней мощности.'),
    (4, 'GeForce RTX 3080',                    1, 52499.25, 'Профессиональная видеокарта, обеспечивающая отличную производительность в современных играх и приложениях для редактирования видео.'),
    (5, 'Barracuda 2TB',                       5, 4124.25,  'Жесткий диск на 2 ТБ с высокой производительностью, подходит для хранения больших объемов данных.'),
    (6, 'RM750x',                              4, 10499.25, 'Модульный блок питания на 750 Вт с сертификатом 80 PLUS Gold, обеспечивающий надежное питание для мощных сборок.'),
    (1, 'AMD Ryzen 7 5800X',                   2, 28999.25, 'Процессор с 8 ядрами и 16 потоками, обеспечивающий отличную производительность для игр и многозадачности.'),
    (1, 'AMD Ryzen 5 5600X',                   2, 19499.25, '6-ядерный процессор с отличным соотношением цена-качество, подходящий для игровых и офисных задач.'),
    (5, 'Western Digital Blue 1TB',            6, 2999.25,  'Надежный жесткий диск на 1 ТБ с хорошей производительностью, идеальный для хранения данных.'),
    (5, 'Western Digital My Passport 2TB',     6, 5500.25,  'Портативный внешний жесткий диск на 2 ТБ, предлагающий отличное решение для хранения данных на ходу.'),
    (4, 'MSI GeForce GTX 1660 Super Gaming X', 8, 29999.25, 'Игровая видеокарта с хорошей производительностью в современных играх и поддержкой технологий NVIDIA.'),
    (2, 'MSI B450 TOMAHAWK MAX',               8, 10999.25, 'Материнская плата для процессоров AMD с улучшенной системой охлаждения и поддержкой пользователей.');

-- Запчасти на складе
INSERT INTO PartsInStock
    (PSt_part, PSt_number)
VALUES
    (1, 2),
    (2, 4),
    (3, 1),
    (4, 3),
    (5, 1),
    (6, 2),
    (7, 4),
    (8, 3),
    (9, 1),
    (10, 2);

-- Запчасти на покупку
INSERT INTO PartsToBuy
    (PB_part, PB_number)
VALUES
    (1, 3),
    (6, 1),
    (7, 2),
    (8, 2),
    (9, 2),
    (5, 2);

COMMIT;
