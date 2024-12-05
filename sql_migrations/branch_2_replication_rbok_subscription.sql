CREATE SUBSCRIPTION clients_subscription_branch_2_to_branch_1
CONNECTION 'host=branch_1 port=5432 dbname=branch_1_db user=branch_2_user password=branch_2_password'
PUBLICATION clients_publication_branch_1
WITH (copy_data = false);