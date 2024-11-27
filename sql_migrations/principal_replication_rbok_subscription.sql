CREATE SUBSCRIPTION clients_subscription_branch_1
CONNECTION 'host=branch_1 port=5432 dbname=branch_1_db user=principal_user password=principal_password'
PUBLICATION clients_publication_branch_1
WITH (copy_data = false)--, create_slot = false, slot_name = 'custom_slot_name');

CREATE SUBSCRIPTION clients_subscription_branch_2
CONNECTION 'host=branch_2 port=5432 dbname=branch_2_db user=principal_user password=principal_password'
PUBLICATION clients_publication_branch_2
WITH (copy_data = false)--, create_slot = false, slot_name = 'custom_slot_name');

