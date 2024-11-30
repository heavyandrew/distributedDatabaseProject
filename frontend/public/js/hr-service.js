class HrService {
    /**
     * 
     */
    static instance = new HrService();

    url = "http://localhost/api";

    /**
     * 
     * @returns {HrService}
     */
    static getInstance() {
        return this.instance;
    }

    /**
     * @returns {Promise<PositionEntity[]>}
     */
    async getPositions() {
        const res = await fetch(this.url + "/positions", {
            method: "GET",
        });

        return res.json().then((b) => b.payload);
    }

    /**
     * 
     * @param {Omit<PositionEntity, "id">} position
     * @returns {Promise<PositionEntity>} 
     */
    async addPosition(position) {
        const res = await fetch(this.url + "/positions", {
            method: "POST",
            body: JSON.stringify(position),
        });

        return res.json().then((b) => b.payload);
    }

    /**
     * 
     * @param {PositionEntity} position
     * @returns {Promise<PositionEntity>} 
     */
    async modifyPosition(position) {
        const res = await fetch(this.url + "/positions", {
            method: "PUT",
            body: JSON.stringify({ position },),
        });

        return res.json().then((b) => b.payload);
    }

    /**
     * 
     * @param {number} id 
     */
    async deletePosition(id) {
        const res = await fetch(this.url + "/positions", {
            method: "DELETE",
            body: JSON.stringify({ id },),
        });

        return res.json((b) => b.payload);
    }

    async getEmployees() {
        const res = await fetch(this.url + "/employees", {
            method: "GET",
        });

        return res.json().then((b) => b.payload);
    }

    /**
     * 
     * @param {EmployeeEntity} employee 
     */
    async addEmployee(employee) {
        
    }

    async modifyEmployee() {

    }

    /**
     * 
     * @param {number} id 
     */
    async deleteEmployee(id) {
        const res = await fetch(this.url + "/employees", {
            method: "DELETE",
            body: JSON.stringify({ id },),
        });

        return res.json((b) => b.payload);
    }
}

/**
 * @typedef {Object} PositionEntity
 * @property {number} id
 * @property {string} name
 */

/**
 * @typedef {Object} EmployeeEntity
 * @property {string} id - Идентификатор сотрудника.
 * @property {string} lastname - Фамилия сотрудника.
 * @property {string} firstname - Имя сотрудника.
 * @property {string} fathername - Отчество сотрудника.
 * @property {string} phone - Телефон сотрудника.
 * @property {string} email - Email сотрудника.
 * @property {string} post - Должность сотрудника.
 * @property {string} service - Служба или подразделение сотрудника.
 * @property {string} hiredate - Дата приема на работу.
 * @property {string|null} firedate - Дата увольнения (может быть null).
 */