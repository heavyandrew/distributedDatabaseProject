class HrService {
    /**
     * 
     */
    static instance = new HrService();

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
        return [
            { id: "1", name: "Инженер по ремонту ноутбуков" },
            { id: "2", name: "Инженер по ремонту ПК" },
            { id: "3", name: "Работник склада" },
            { id: "4", name: "Менеджер по обслуживанию клиентов" },
            { id: "5", name: "Менеджер по работе с персоналом" },
            { id: "6", name: "Руководитель склада" },
        ]
    }

    /**
     * 
     * @param {PositionEntity} position
     * @returns {Promise<void>} 
     */
    async addPosition(position) {

    }

    /**
     * 
     * @param {PositionEntity} position
     * @returns {Promise<void>} 
     */
    async modifyPosition(position) {

    }

    async getEmployees() {

    }

    async addEmployee() {

    }

    async modifyEmployee() {

    }
}

/**
 * @typedef {Object} PositionEntity
 * @property {string} id
 * @property {string} name
 */
