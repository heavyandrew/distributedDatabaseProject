BEGIN;

CREATE ROLE branch_2_user REPLICATION LOGIN PASSWORD 'branch_2_password';

GRANT SELECT ON TABLE  Clients
                                TO principal_user;
GRANT SELECT ON TABLE  Clients
                                TO branch_2_user;

CREATE PUBLICATION clients_publication_branch_1 FOR TABLE Clients;


COMMIT;