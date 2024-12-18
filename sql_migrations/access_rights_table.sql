BEGIN;

CREATE TABLE user_roles (
    role_name VARCHAR(50) PRIMARY KEY, -- Название роли
    description TEXT                   -- Описание задачи роли
);

CREATE TABLE role_permissions (
    role_name VARCHAR(50) REFERENCES user_roles(role_name), -- Роль
    object_name VARCHAR(100),                               -- Таблица или объект
    privilege VARCHAR(50),                                  -- Привилегия (SELECT, INSERT, UPDATE, DELETE и т.д.)
    PRIMARY KEY (role_name, object_name, privilege)         -- Уникальная комбинация
);

-- Заполнение таблиц
INSERT INTO user_roles (role_name, description) VALUES 
('hr_director', 'Директор по персоналу'),
('central_office_admin', 'Администратор центрального офиса'),
('chief_technical_engineer', 'Главный технический инженер'),
('warehouse_employee', 'Сотрудник склада'),
('service_employee', 'Сотрудник сервиса');

INSERT INTO role_permissions (role_name, object_name, privilege) VALUES
-- Директор по персоналу
('hr_director', 'Employees', 'SELECT'),
('hr_director', 'Employees', 'INSERT'),
('hr_director', 'Employees', 'UPDATE'),
('hr_director', 'Employees', 'DELETE'),

('hr_director', 'Positions', 'SELECT'),
('hr_director', 'Positions', 'INSERT'),
('hr_director', 'Positions', 'UPDATE'),
('hr_director', 'Positions', 'DELETE'),

('hr_director', 'AddPosition', 'EXECUTE'),
('hr_director', 'UpdatePosition', 'EXECUTE'),
('hr_director', 'DeletePosition', 'EXECUTE'),
('hr_director', 'AddEmployee', 'EXECUTE'),
('hr_director', 'UpdateEmployee', 'EXECUTE'),
('hr_director', 'TerminateEmployee', 'EXECUTE'),
('hr_director', 'DeleteEmployee', 'EXECUTE'),


-- Администратор центрального офиса
('central_office_admin', 'Branches', 'SELECT'),
('central_office_admin', 'Branches', 'INSERT'),
('central_office_admin', 'Branches', 'UPDATE'),
('central_office_admin', 'Branches', 'DELETE'),

('central_office_admin', 'OrderStatuses', 'SELECT'),
('central_office_admin', 'OrderStatuses', 'INSERT'),
('central_office_admin', 'OrderStatuses', 'UPDATE'),
('central_office_admin', 'OrderStatuses', 'DELETE'),

('central_office_admin', 'Services', 'SELECT'),
('central_office_admin', 'Services', 'INSERT'),
('central_office_admin', 'Services', 'UPDATE'),
('central_office_admin', 'Services', 'DELETE'),

('central_office_admin', 'AddBranch', 'EXECUTE'),
('central_office_admin', 'UpdateBranch', 'EXECUTE'),
('central_office_admin', 'DeleteBranch', 'EXECUTE'),

('central_office_admin', 'AddOrderStatus', 'EXECUTE'),
('central_office_admin', 'UpdateOrderStatus', 'EXECUTE'),
('central_office_admin', 'DeleteOrderStatus', 'EXECUTE'),

('central_office_admin', 'AddService', 'EXECUTE'),
('central_office_admin', 'UpdateService', 'EXECUTE'),
('central_office_admin', 'DeleteService', 'EXECUTE'),


-- Главный технический инженер
('chief_technical_engineer', 'DeviceTypes', 'SELECT'),
('chief_technical_engineer', 'DeviceTypes', 'INSERT'),
('chief_technical_engineer', 'DeviceTypes', 'UPDATE'),
('chief_technical_engineer', 'DeviceTypes', 'DELETE'),

('chief_technical_engineer', 'PartTypes', 'SELECT'),
('chief_technical_engineer', 'PartTypes', 'INSERT'),
('chief_technical_engineer', 'PartTypes', 'UPDATE'),
('chief_technical_engineer', 'PartTypes', 'DELETE'),

('chief_technical_engineer', 'Models', 'SELECT'),
('chief_technical_engineer', 'Models', 'INSERT'),
('chief_technical_engineer', 'Models', 'UPDATE'),
('chief_technical_engineer', 'Models', 'DELETE'),

('chief_technical_engineer', 'ModelsOfParts', 'SELECT'),
('chief_technical_engineer', 'ModelsOfParts', 'INSERT'),
('chief_technical_engineer', 'ModelsOfParts', 'UPDATE'),
('chief_technical_engineer', 'ModelsOfParts', 'DELETE'),

('chief_technical_engineer', 'Services', 'SELECT'),
('chief_technical_engineer', 'Services', 'INSERT'),
('chief_technical_engineer', 'Services', 'UPDATE'),
('chief_technical_engineer', 'Services', 'DELETE'),

('chief_technical_engineer', 'AddDeviceType', 'EXECUTE'),
('chief_technical_engineer', 'UpdateDeviceType', 'EXECUTE'),
('chief_technical_engineer', 'DeleteDeviceType', 'EXECUTE'),

('chief_technical_engineer', 'AddPartType', 'EXECUTE'),
('chief_technical_engineer', 'UpdatePartType', 'EXECUTE'),
('chief_technical_engineer', 'DeletePartType', 'EXECUTE'),

('chief_technical_engineer', 'AddModel', 'EXECUTE'),
('chief_technical_engineer', 'UpdateModel', 'EXECUTE'),
('chief_technical_engineer', 'DeleteModel', 'EXECUTE'),

('chief_technical_engineer', 'AddPartModel', 'EXECUTE'),
('chief_technical_engineer', 'UpdatePartModel', 'EXECUTE'),
('chief_technical_engineer', 'DeletePartModel', 'EXECUTE'),

('chief_technical_engineer', 'AddService', 'EXECUTE'),
('chief_technical_engineer', 'UpdateService', 'EXECUTE'),
('chief_technical_engineer', 'DeleteService', 'EXECUTE'),


-- Сотрудник склада
('warehouse_employee', 'SupplyRequests', 'SELECT'),
('warehouse_employee', 'SupplyRequests', 'UPDATE'),

('warehouse_employee', 'Supplies', 'SELECT'),
('warehouse_employee', 'Supplies', 'INSERT'),
('warehouse_employee', 'Supplies', 'UPDATE'), 

('warehouse_employee', 'PartsToBuy', 'SELECT'),
('warehouse_employee', 'PartsToBuy', 'INSERT'),
('warehouse_employee', 'PartsToBuy', 'UPDATE'), 
('warehouse_employee', 'PartsToBuy', 'DELETE'), 

('warehouse_employee', 'PartsInStock', 'SELECT'),
('warehouse_employee', 'PartsInStock', 'INSERT'),
('warehouse_employee', 'PartsInStock', 'UPDATE'), 
('warehouse_employee', 'PartsInStock', 'DELETE'), 

('warehouse_employee', 'UpdateSupplyRequestStatus', 'EXECUTE'),
('warehouse_employee', 'AddSupply', 'EXECUTE'),
('warehouse_employee', 'UpdateSupply', 'EXECUTE'),

('warehouse_employee', 'AddPartInSupply', 'EXECUTE'),
('warehouse_employee', 'UpdatePartInSupply', 'EXECUTE'),
('warehouse_employee', 'UpsertPartInStock', 'EXECUTE'),


-- Сотрудник сервиса
('service_employee', 'Clients', 'SELECT'),
('service_employee', 'Clients', 'INSERT'),
('service_employee', 'Clients', 'UPDATE'),
('service_employee', 'Clients', 'DELETE'),

('service_employee', 'Orders', 'SELECT'),
('service_employee', 'Orders', 'INSERT'),
('service_employee', 'Orders', 'UPDATE'),

('service_employee', 'SupplyRequests', 'SELECT'),
('service_employee', 'SupplyRequests', 'INSERT'),
('service_employee', 'SupplyRequests', 'UPDATE'),

('service_employee', 'RequestStatuses', 'SELECT'),
('service_employee', 'RequestStatuses', 'UPDATE'),

('service_employee', 'ServicesInOrders', 'SELECT'),
('service_employee', 'ServicesInOrders', 'INSERT'),
('service_employee', 'ServicesInOrders', 'UPDATE'),
('service_employee', 'ServicesInOrders', 'DELETE'),

('service_employee', 'PartsInStock', 'SELECT'),

('service_employee', 'PartsInService', 'SELECT'),
('service_employee', 'PartsInService', 'INSERT'),
('service_employee', 'PartsInService', 'UPDATE'),
('service_employee', 'PartsInService', 'DELETE'),

('service_employee', 'AddClient', 'EXECUTE'),
('service_employee', 'UpdateClient', 'EXECUTE'),
('service_employee', 'DeleteClient', 'EXECUTE'),

('service_employee', 'AddOrder', 'EXECUTE'),
('service_employee', 'UpdateOrder', 'EXECUTE'),

('service_employee', 'AddServiceInOrder', 'EXECUTE'),
('service_employee', 'UpdateServiceInOrder', 'EXECUTE'),

('service_employee', 'CreateSupplyRequest', 'EXECUTE'),

('service_employee', 'CheckServiceEmployee', 'EXECUTE');

COMMIT;
