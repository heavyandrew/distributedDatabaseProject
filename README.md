# distributedDatabaseProject

### Run db: 
make run

### Run migration:
make migrate

(в Makefile указан конкретный файл миграции, пока не разобрался, как запустить все миграции, * почему-то не работает)

### Пример энв-файла

POSTGRES_DB=mydatabase

POSTGRES_USER=myuser

POSTGRES_PASSWORD=mypassword

POSTGRES_PORT=5432


DJANGO_SECRET_KEY=mysecretkey

DJANGO_DEBUG=True