BEGIN;

-- Table: Clients
CREATE TABLE Clients (
    S_id SERIAL PRIMARY KEY,
    S_name VARCHAR(100) NOT NULL,
    S_phone VARCHAR(20) NOT NULL,
    S_email VARCHAR(50),
    C_num_counter INT
);

-- Table: OrderStatuses
CREATE TABLE OrderStatuses (
    OS_id SERIAL PRIMARY KEY,
    OS_status VARCHAR(20) NOT NULL
);

-- Table: Positions
CREATE TABLE Positions (
    P_id SERIAL PRIMARY KEY,
    P_name VARCHAR(100) NOT NULL
);

-- Table: RequestStatuses
CREATE TABLE RequestStatuses (
    RS_id SERIAL PRIMARY KEY,
    RS_name VARCHAR(50) NOT NULL
);

-- Table: Services
CREATE TABLE Services (
    S_id SERIAL PRIMARY KEY,
    S_name VARCHAR(30) NOT NULL,
    S_description VARCHAR(100) NOT NULL,
    S_price DECIMAL(10, 2)
);

-- Table: DeviceTypes
CREATE TABLE DeviceTypes (
    DT_id SERIAL PRIMARY KEY,
    DT_name VARCHAR(100) NOT NULL
);

-- Table: DeviceBrands
CREATE TABLE DeviceBrands (
    DB_id SERIAL PRIMARY KEY,
    DB_name VARCHAR(30) NOT NULL,
    DB_description VARCHAR(500)
);

-- Table: Models
CREATE TABLE Models (
    M_id SERIAL PRIMARY KEY,
    M_type INT NOT NULL,
    M_brand INT,
    M_name VARCHAR(30) NOT NULL,
    M_description VARCHAR(1000),
    CONSTRAINT fk_type FOREIGN KEY (M_type) REFERENCES DeviceTypes(DT_id),
    CONSTRAINT fk_brand FOREIGN KEY (M_brand) REFERENCES DeviceBrands(DB_id)
);

-- Table: Devices
CREATE TABLE Devices (
    D_id SERIAL PRIMARY KEY,
    D_model INT NOT NULL,
    D_description VARCHAR(2000),
    CONSTRAINT fk_model FOREIGN KEY (D_model) REFERENCES Models(M_id)
);

-- Table: Branches (Филиалы)
CREATE TABLE Branches (
    S_id SERIAL PRIMARY KEY,
    S_address VARCHAR(200) NOT NULL,
    S_opening_date DATE,
    S_closing_date DATE
);

-- Table: Employees
CREATE TABLE Employees (
    E_id SERIAL PRIMARY KEY,
    E_lastname VARCHAR(30) NOT NULL,
    E_name VARCHAR(30) NOT NULL,
    E_patronymic VARCHAR(30),
    E_phone VARCHAR(20) NOT NULL,
    E_email VARCHAR(50),
    E_post INT NOT NULL,
    E_service INT NOT NULL,
    E_hiring_date DATE,
    E_quit_date DATE CHECK (E_quit_date >= E_hiring_date),
    CONSTRAINT fk_post FOREIGN KEY (E_post) REFERENCES Positions(P_id),
    CONSTRAINT fk_service FOREIGN KEY (E_service) REFERENCES Branches(S_id)
);

-- Table: Orders
CREATE TABLE Orders (
    O_id SERIAL PRIMARY KEY,
    O_client_id INT NOT NULL,
    O_status INT NOT NULL,
    O_employee INT NOT NULL,
    O_device INT NOT NULL,
    O_note VARCHAR(100),
    O_date DATE NOT NULL,
    O_final_price DECIMAL(10, 2),
    CONSTRAINT fk_client FOREIGN KEY (O_client_id) REFERENCES Clients(S_id),
    CONSTRAINT fk_status FOREIGN KEY (O_status) REFERENCES OrderStatuses(OS_id),
    CONSTRAINT fk_employee FOREIGN KEY (O_employee) REFERENCES Employees(E_id),
    CONSTRAINT fk_device FOREIGN KEY (O_device) REFERENCES Devices(D_id)
);

-- Table: Reviews
CREATE TABLE Reviews (
    R_id SERIAL PRIMARY KEY,
    R_order_id INT NOT NULL,
    R_score INT NOT NULL CHECK (R_score BETWEEN 1 AND 5),
    R_text VARCHAR(1000),
    CONSTRAINT fk_order_id FOREIGN KEY (R_order_id) REFERENCES Orders(O_id)
);

-- Table: PartTypes
CREATE TABLE PartTypes (
    PT_id SERIAL PRIMARY KEY,
    PT_name VARCHAR(30) NOT NULL,
    PT_description VARCHAR(500)
);

-- Table: PartsBrands
CREATE TABLE PartsBrands (
    PB_id SERIAL PRIMARY KEY,
    PB_name VARCHAR(30) NOT NULL,
    PB_description VARCHAR(500)
);

-- Table: ModelsOfParts
CREATE TABLE ModelsOfParts (
    MP_id SERIAL PRIMARY KEY,
    MP_type_id INT NOT NULL,
    MP_name VARCHAR(30) NOT NULL,
    MP_brand INT,
    MP_price DECIMAL(8, 2) NOT NULL,
    MP_description VARCHAR(1000),
    CONSTRAINT fk_type_id FOREIGN KEY (MP_type_id) REFERENCES PartTypes(PT_id),
    CONSTRAINT fk_brand FOREIGN KEY (MP_brand) REFERENCES PartsBrands(PB_id)
);

-- Table: PartsInService
CREATE TABLE PartsInService (
    PS_id SERIAL PRIMARY KEY,
    PS_service_id INT NOT NULL,
    PS_part_id INT NOT NULL,
    PS_number INT DEFAULT 0,
    CONSTRAINT chk_ps_number CHECK (PS_number >= 0),
    CONSTRAINT fk_service_id FOREIGN KEY (PS_service_id) REFERENCES Branches(S_id),
    CONSTRAINT fk_part_id FOREIGN KEY (PS_part_id) REFERENCES ModelsOfParts(MP_id)
);

-- Table: ServicesInOrders
CREATE TABLE ServicesInOrders (
    SO_id SERIAL PRIMARY KEY,
    SO_service_id INT,
    SO_part INT,
    SO_order INT NOT NULL,
    CONSTRAINT fk_service FOREIGN KEY (SO_service_id) REFERENCES Services(S_id),
    CONSTRAINT fk_part FOREIGN KEY (SO_part) REFERENCES PartsInService(PS_id),
    CONSTRAINT fk_order FOREIGN KEY (SO_order) REFERENCES Orders(O_id)
);

-- Table: SupplyRequests
CREATE TABLE SupplyRequests (
    SR_id SERIAL PRIMARY KEY,
    SR_part INT NOT NULL,
    SR_number INT CHECK (SR_number > 0),
    SR_service INT NOT NULL,
    SR_created_at DATE NOT NULL,
    SR_closed_at DATE,
    SR_status INT DEFAULT 1 NOT NULL,
    CONSTRAINT fk_part FOREIGN KEY (SR_part) REFERENCES ModelsOfParts(MP_id),
    CONSTRAINT fk_service FOREIGN KEY (SR_service) REFERENCES Branches(S_id),
    CONSTRAINT fk_status FOREIGN KEY (SR_status) REFERENCES RequestStatuses(RS_id)
);

-- Table: PartsInStock
CREATE TABLE PartsInStock (
    PSt_id SERIAL PRIMARY KEY,
    PSt_part INT NOT NULL,
    PSt_number INT DEFAULT 0 CHECK (PSt_number >= 0),
    CONSTRAINT fk_part FOREIGN KEY (PSt_part) REFERENCES ModelsOfParts(MP_id)
);

-- Table: PartsToBuy
CREATE TABLE PartsToBuy (
    PB_id SERIAL PRIMARY KEY,
    PB_part INT NOT NULL,
    PB_number INT CHECK (PB_number > 0),
    CONSTRAINT fk_part FOREIGN KEY (PB_part) REFERENCES ModelsOfParts(MP_id)
);

-- Table: Supplies
CREATE TABLE Supplies (
    Su_id SERIAL PRIMARY KEY,
    Su_from_employee INT,
    Su_delivery_employee INT,
    Su_apply_employee INT,
    Su_car VARCHAR(9),
    Su_date DATE,
    CONSTRAINT fk_from_employee FOREIGN KEY (Su_from_employee) REFERENCES Employees(E_id),
    CONSTRAINT fk_delivery_employee FOREIGN KEY (Su_delivery_employee) REFERENCES Employees(E_id),
    CONSTRAINT fk_apply_employee FOREIGN KEY (Su_apply_employee) REFERENCES Employees(E_id)
);

-- Table: PartsInSupply
CREATE TABLE PartsInSupply (
    PSu_id SERIAL PRIMARY KEY,
    PSu_part INT NOT NULL,
    PSu_supply INT NOT NULL,
    PSu_number INT NOT NULL CHECK (PSu_number > 0),
    CONSTRAINT fk_part FOREIGN KEY (PSu_part) REFERENCES ModelsOfParts(MP_id),
    CONSTRAINT fk_supply FOREIGN KEY (PSu_supply) REFERENCES Supplies(Su_id)
);

COMMIT;
