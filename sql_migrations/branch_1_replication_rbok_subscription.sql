CREATE SUBSCRIPTION clients_subscription_branch_1_to_branch_2
CONNECTION 'host=branch_2 port=5432 dbname=branch_2_db user=branch_1_user password=branch_1_password'
PUBLICATION clients_publication_branch_2
WITH (copy_data = false);
