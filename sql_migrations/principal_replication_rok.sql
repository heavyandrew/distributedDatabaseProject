BEGIN;

-- Создание ролей для репликации
CREATE ROLE branch_1_user REPLICATION LOGIN PASSWORD 'branch_1_password';
CREATE ROLE branch_2_user REPLICATION LOGIN PASSWORD 'branch_2_password';

-- Выдача прав SELECT на указанные таблицы для branch_1_user
GRANT SELECT ON TABLE DeviceBrands, DeviceTypes, Models, Positions, Employees,
                  Services, OrderStatuses, RequestStatuses, PartsBrands, PartTypes TO branch_1_user;

-- Выдача прав SELECT на указанные таблицы для branch_2_user
GRANT SELECT ON TABLE DeviceBrands, DeviceTypes, Models, Positions, Employees,
                  Services, OrderStatuses, RequestStatuses, PartsBrands, PartTypes TO branch_2_user;

-- Создание публикации для репликации
CREATE PUBLICATION rok_pub1 FOR TABLE DeviceBrands, DeviceTypes, Models, Positions, Employees,
                                Services, OrderStatuses, RequestStatuses, PartsBrands, PartTypes;

-- Создание публикации для репликации
CREATE PUBLICATION rok_pub2 FOR TABLE DeviceBrands, DeviceTypes, Models, Positions, Employees,
                                Services, OrderStatuses, RequestStatuses, PartsBrands, PartTypes;

COMMIT;