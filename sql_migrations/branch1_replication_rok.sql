CREATE SUBSCRIPTION rok_pub1
CONNECTION 'host=principal port=5432 dbname=principal_db user=branch_1_user password=branch_1_password'
PUBLICATION rok_pub1
WITH (copy_data = false);