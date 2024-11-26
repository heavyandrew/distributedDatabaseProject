BEGIN

CREATE PUBLICATION branch1_increment FOR TABLE Reviews, Devices, Orders, ServicesInOrders;

CREATE PUBLICATION branch1_twice FOR TABLE PartsInService;

CREATE PUBLICATION branch1_workflow FOR TABLE Supplies, SupplyRequests;

COMMIT;