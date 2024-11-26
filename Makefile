# ENV_FILE := .env
ENV_FILE := .env.principal
# ENV_FILE := .env.branch_1
# ENV_FILE := .env.branch_2
include $(ENV_FILE)
export $(shell sed 's/=.*//' $(ENV_FILE))

run:
	docker-compose build && docker-compose up -d

rb-a:
	docker-compose down && docker-compose build && docker-compose up -d

down:
	docker-compose down

migrate_custom:
	docker-compose exec branch_2 psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -f app/sql_migrations/branch2_replication_rok.sql

migrate_1:
	docker-compose exec principal psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -f app/sql_migrations/create_tables.sql
	docker-compose exec principal psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -f app/sql_migrations/principal_data.sql
	docker-compose exec principal psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -f app/sql_migrations/branch_1_data.sql
	docker-compose exec principal psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -f app/sql_migrations/branch_2_data.sql
	docker-compose exec principal psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -f app/sql_migrations/principal_replication_rok.sql

migrate_2:
	docker-compose exec branch_1 psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -f app/sql_migrations/create_tables.sql
	docker-compose exec branch_1 psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -f app/sql_migrations/principal_data.sql
	docker-compose exec branch_1 psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -f app/sql_migrations/branch_1_data.sql
	docker-compose exec branch_1 psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -f app/sql_migrations/branch1_replication_rok.sql

migrate_3:
	docker-compose exec branch_2 psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -f app/sql_migrations/create_tables.sql
	docker-compose exec branch_2 psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -f app/sql_migrations/principal_data.sql
	docker-compose exec branch_2 psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -f app/sql_migrations/branch_2_data.sql
	docker-compose exec branch_2 psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -f app/sql_migrations/branch2_replication_rok.sql


#create_tables:
#	docker-compose exec db psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -f app/sql_migrations/create_tables.sql
#
#migrate_1:
#	docker-compose exec db psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -f app/sql_migrations/principal_data.sql
#
#migrate_2:
#	docker-compose exec db psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -f app/sql_migrations/branch_1_data.sql
#
#migrate_3:
#	docker-compose exec db psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -f app/sql_migrations/branch_2_data.sql


#dump:
#	docker-compose exec db pg_dump -U ${POSTGRES_USER} ${POSTGRES_DB} > app/dumps/db_dump_`date +%Y%m%d_%H%M%S`.sql