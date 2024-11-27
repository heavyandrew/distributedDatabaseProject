CREATE SUBSCRIPTION clients_subscription_branch_2
CONNECTION 'host=branch_1 port=5432 dbname=branch_1_db user=branch_2_user password=branch_2_password'
PUBLICATION clients_subscription_branch_2;
WITH (copy_data = false);