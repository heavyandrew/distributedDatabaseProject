CREATE SUBSCRIPTION clients_subscription
CONNECTION 'host=branch1 port=5432 dbname=branch1_db user=branch_2_user password=branch_2_password'
PUBLICATION clients_publication;