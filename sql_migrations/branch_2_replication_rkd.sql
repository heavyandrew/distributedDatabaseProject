BEGIN

CREATE PUBLICATION branch2_increment FOR TABLE Reviews, Devices, Orders, ServicesInOrders;

CREATE PUBLICATION branch2_twice FOR TABLE PartsInService;

CREATE PUBLICATION branch2_workflow FOR TABLE Supplies, SupplyRequests;

COMMIT;