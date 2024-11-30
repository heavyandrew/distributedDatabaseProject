export class FakeApi {

    private readonly positions: Position[] = [
        { id: 1, name: "Инженер по ремонту ноутбуков" },
        { id: 2, name: "Инженер по ремонту ПК" },
        { id: 3, name: "Работник склада" },
        { id: 4, name: "Менеджер по обслуживанию клиентов" },
        { id: 5, name: "Менеджер по работе с персоналом" },
        { id: 6, name: "Руководитель склада" },
    ];

    private readonly employees: EmployeeSchema[] = [
        { id: 0, lastname: 'Иванов',   firstname: 'Иван',       fathername: 'Иванович',    phone: '89991234567', email: 'ivan.ivanov@example.com',         post: 1, service: 4, hiredate: '2021-09-22', firedate: null},
        { id: 1, lastname: 'Петров',   firstname: 'Петр',       fathername: 'Петрович',    phone: '89998765432', email: 'petr.petrov@example.com',         post: 4, service: 1, hiredate: '2021-09-30', firedate: null},
        { id: 2, lastname: 'Сидоров',  firstname: 'Сидор',      fathername: 'Сидорович',   phone: '89995551234', email: 'sidor.sidorov@example.com',       post: 2, service: 4, hiredate: '2021-09-02', firedate: '2023-08-20'},
        { id: 3, lastname: 'Кузнецов', firstname: 'Алексей',    fathername: 'Алексеевич',  phone: '89993334455', email: 'alexey.kuznetsov@example.com',    post: 2, service: 2, hiredate: '2022-02-24', firedate: null},
        { id: 4, lastname: 'Семёнов',  firstname: 'Анатолий',   fathername: 'Анатольевич', phone: '89992223344', email: 'anatoly.semenov@example.com',     post: 3, service: 1, hiredate: '2021-09-02', firedate: null},
        { id: 5, lastname: 'Егорова',  firstname: 'Мария',      fathername: 'Николаевна',  phone: '89991112233', email: 'maria.egorova@example.com',       post: 3, service: 1, hiredate: '2021-10-02', firedate: null},
        { id: 6, lastname: 'Фёдорова', firstname: 'Юлия',       fathername: 'Дмитриевна',  phone: '89990001122', email: 'yuliia.fyodorova@example.com',    post: 5, service: 1, hiredate: '2022-06-11', firedate: '2022-12-01'},
        { id: 7, lastname: 'Антонова', firstname: 'Мария',      fathername: 'Сергеевна',   phone: '89990001122', email: 'maria.antn@example.com',          post: 5, service: 1, hiredate: '2023-01-29', firedate: null},
        { id: 8, lastname: 'Зайцев',   firstname: 'Сергей',     fathername: 'Сергеевич',   phone: '89981114455', email: 'sergey.zaytsev@example.com',      post: 1, service: 3, hiredate: '2021-11-09', firedate: null},
        { id: 9, lastname: 'Лебедев',  firstname: 'Константин', fathername: 'Игоревич',    phone: '89985552211', email: 'konstantin.lebedyev@example.com', post: 6, service: 1, hiredate: '2021-08-15', firedate: null},
        { id: 10, lastname: 'Тихонов',  firstname: 'Олег',       fathername: 'Семёнович',   phone: '89989998888', email: 'oleg.tikhonov@example.com',       post: 1, service: 3, hiredate: '2021-09-05', firedate: null},
    ];

    /**
     */
    public async getPositions() {
        return this.positions;
    }

    /**
     * 
     */
    public async addPosition(position: Omit<Position, "id">) {
        const pos = {
            id: Math.round(Math.random() * 100) + 10,
            name: position.name,
        };
        this.positions.push(pos);
        return pos;
    }

    /**
     * 
     */
    async modifyPosition(position: Position) {
        const pos = this.positions.find((p) => p.id === position.id);
        if(pos) {
            Object.assign(pos, position);
            return pos;
        }
        return null;
    }

    /**
     * 
     */
    async deletePosition(id: number) {
        const idx = this.positions.findIndex((p) => p.id === id);
        if(idx !== -1) {
            this.positions.splice(idx, 1);
            return true;
        }
        return false;
    }

    /**
     * 
     * @returns 
     */
    async getEmployees(): Promise<Employee[]> {
        return this.employees.map((e) => {
            const post = this.positions.find((p) => p.id === e.post)!;
            
            return {
                ...e,
                post: post.name,
                service: "test",    
            }
        });
    }

    async addEmployee(employee: Omit<Employee, "id">) {
        const emp: Employee = {
            id: Math.round(Math.random() * 100) + 10,
            name: position.name,
        };
        this.positions.push(pos);
        return pos;
    }

    /**
     * 
     * @param id 
     * @returns 
     */
    async deleteEmployee(id: number) {
        const idx = this.employees.findIndex((p) => p.id === id);
        if(idx !== -1) {
            this.positions.splice(idx, 1);
            return true;
        }
        return false;
    }
}

type Position = {
    id: number,
    name: string
};

type EmployeeSchema = {
    id: number,
    lastname: string,
    firstname: string,
    fathername: string,
    phone: string,
    email: string,
    post: number,
    service: number,
    hiredate: string,
    firedate: string | null,
};

type Employee = Omit<EmployeeSchema, "post" | "service"> & {
    post: string;
    service: string;
};
