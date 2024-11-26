CREATE SUBSCRIPTION rok_pub2
CONNECTION 'host=principal port=5432 dbname=principal_db user=branch_2_user password=branch_2_password'
PUBLICATION rok_pub2
WITH (copy_data = false);