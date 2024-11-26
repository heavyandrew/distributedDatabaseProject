CREATE SUBSCRIPTION clients_subscription
CONNECTION 'host=branch2 port=5432 dbname=branch2_db user=branch_1_user password=branch_1_password'
PUBLICATION clients_publication;