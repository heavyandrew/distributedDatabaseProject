BEGIN;

CREATE SUBSCRIPTION clients_subscription_branch1
CONNECTION 'host=branch1 port=5432 dbname=branch1_db user=principal_user password=principal_password'
PUBLICATION clients_publication;

CREATE SUBSCRIPTION clients_subscription_branch2
CONNECTION 'host=branch2 port=5432 dbname=branch2_db user=principal_user password=principal_password'
PUBLICATION clients_publication;

COMMIT;
