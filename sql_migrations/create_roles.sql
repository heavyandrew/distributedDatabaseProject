BEGIN;

-- 1. Создание ролей
CREATE ROLE hr_director NOINHERIT;
CREATE ROLE central_office_admin NOINHERIT;
CREATE ROLE chief_technical_engineer NOINHERIT;
CREATE ROLE warehouse_employee NOINHERIT;
CREATE ROLE service_employee NOINHERIT;

-- 2. Присвоение прав доступа, включая функции
DO $$
DECLARE
    role RECORD;
BEGIN
    -- Цикл по всем записям из role_permissions
    FOR role IN SELECT * FROM role_permissions LOOP
        IF role.privilege = 'EXECUTE' THEN
            EXECUTE format('GRANT EXECUTE ON FUNCTION %s TO %s;', role.object_name, role.role_name);
        ELSE
            EXECUTE format('GRANT %s ON %s TO %s;', role.privilege, role.object_name, role.role_name);
        END IF;
    END LOOP;
END;
$$;

-- 3. Создание пользователей и назначение ролей
DO $$
BEGIN
    CREATE USER hr_user WITH PASSWORD 'password_hr';
    GRANT hr_director TO hr_user;

    CREATE USER admin_user WITH PASSWORD 'password_admin';
    GRANT central_office_admin TO admin_user;

    CREATE USER engineer_user WITH PASSWORD 'password_engineer';
    GRANT chief_technical_engineer TO engineer_user;

    CREATE USER warehouse_user WITH PASSWORD 'password_warehouse';
    GRANT warehouse_employee TO warehouse_user;

    CREATE USER service_user WITH PASSWORD 'password_service';
    GRANT service_employee TO service_user;
END;
$$;

COMMIT;
