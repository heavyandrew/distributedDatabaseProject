BEGIN

CREATE SUBSCRIPTION branch1_workflow
CONNECTION 'host=branch1 port=5432 dbname=branch1_db user=principal_user password=principal_password'
PUBLICATION branch1_increment;

CREATE SUBSCRIPTION branch2_workflow
CONNECTION 'host=branch2 port=5432 dbname=branch2_db user=principal_user password=principal_password'
PUBLICATION branch2_workflow;

COMMIT;