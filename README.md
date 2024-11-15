# distributedDatabaseProject

### Run db: 
make run

### Run migrations:
make migrate

### Add new migration
1. Создать файл в ./sql_migrations
2. Добавить его в ./Makefile docker-compose exec db psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -f app/sql_migrations/<your_file_name>.sql


### Пример энв-файла

POSTGRES_DB=mydatabase

POSTGRES_USER=myuser

POSTGRES_PASSWORD=mypassword

POSTGRES_PORT=5432


DJANGO_SECRET_KEY=mysecretkey

DJANGO_DEBUG=True