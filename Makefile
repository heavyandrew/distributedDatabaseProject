include .env
export $(shell sed 's/=.*//' .env)

run:
	docker-compose build && docker-compose up -d

rb-a:
	docker-compose down && docker-compose build && docker-compose up -d

down:
	docker-compose down

migrate:
	docker-compose exec db psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -f app/sql_migrations/create_tables.sql
	docker-compose exec db psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -f app/sql_migrations/principal_data.sql
	docker-compose exec db psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -f app/sql_migrations/branch_1_data.sql
	docker-compose exec db psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -f app/sql_migrations/branch_2_data.sql

#dump:
#	docker-compose exec db pg_dump -U ${POSTGRES_USER} ${POSTGRES_DB} > app/dumps/db_dump_`date +%Y%m%d_%H%M%S`.sql