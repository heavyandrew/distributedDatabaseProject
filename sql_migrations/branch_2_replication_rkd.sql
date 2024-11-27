BEGIN

CREATE ROLE principal_user REPLICATION LOGIN PASSWORD 'principal_password';

GRANT SELECT ON TABLE  Reviews, Devices, Orders, ServicesInOrders, PartsInService, Supplies, SupplyRequests
                                                                                                TO principal_user;

CREATE PUBLICATION branch_2_increment FOR TABLE Reviews, Devices, Orders, ServicesInOrders;
CREATE PUBLICATION branch_2_twice FOR TABLE PartsInService;
CREATE PUBLICATION branch_2_workflow FOR TABLE Supplies, SupplyRequests;

COMMIT;