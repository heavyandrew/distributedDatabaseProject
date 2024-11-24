# distributedDatabaseProject

### Run db: 
make run

### Накат миграций
раскомментируем энвы в начале Makefile для чтения из .env.principal
make migrate_1

комментируем энвы в начале Makefile для чтения из .env.principal
раскомментируем энвы в начале Makefile для чтения из .env.branch_1
make migrate_2

комментируем энвы в начале Makefile для чтения из .env.branch_1
раскомментируем энвы в начале Makefile для чтения из .env.branch_2
make migrate_3