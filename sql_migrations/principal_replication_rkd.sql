CREATE SUBSCRIPTION branch_1_increment
CONNECTION 'host=branch_1 port=5432 dbname=branch_1_db user=principal_user password=principal_password'
PUBLICATION branch_1_increment;
WITH (copy_data = false);

CREATE SUBSCRIPTION branch_2_increment
CONNECTION 'host=branch_2 port=5432 dbname=branch_2_db user=principal_user password=principal_password'
PUBLICATION branch_2_increment;
WITH (copy_data = false);

CREATE SUBSCRIPTION branch_1_workflow
CONNECTION 'host=branch_1 port=5432 dbname=branch_1_db user=principal_user password=principal_password'
PUBLICATION branch_1_increment;
WITH (copy_data = false);

CREATE SUBSCRIPTION branch_2_workflow
CONNECTION 'host=branch_2 port=5432 dbname=branch_2_db user=principal_user password=principal_password'
PUBLICATION branch_2_workflow;
WITH (copy_data = false);

CREATE SUBSCRIPTION branch_1_twice
CONNECTION 'host=branch_1 port=5432 dbname=branch_1_db user=principal_user password=principal_password'
PUBLICATION branch_1_twice;
WITH (copy_data = false);

CREATE SUBSCRIPTION branch_2_twice
CONNECTION 'host=branch_2 port=5432 dbname=branch_2_db user=principal_user password=principal_password'
PUBLICATION branch_2_twice;
WITH (copy_data = false);