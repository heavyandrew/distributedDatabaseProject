BEGIN;

CREATE ROLE branch_1_user REPLICATION LOGIN PASSWORD 'branch_1_password';

GRANT SELECT ON TABLE  Clients
                                TO principal_user;
GRANT SELECT ON TABLE  Clients
                                TO branch_1_user;

CREATE PUBLICATION clients_publication_branch_2 FOR TABLE Clients;

COMMIT;