class HrService {
    /**
     * 
     */
    static instance = new HrService();

    positions = [
        { id: "1", name: "Инженер по ремонту ноутбуков" },
        { id: "2", name: "Инженер по ремонту ПК" },
        { id: "3", name: "Работник склада" },
        { id: "4", name: "Менеджер по обслуживанию клиентов" },
        { id: "5", name: "Менеджер по работе с персоналом" },
        { id: "6", name: "Руководитель склада" },
    ];

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
        return this.positions;
    }

    /**
     * 
     * @param {string} positionName
     * @returns {Promise<void>} 
     */
    async addPosition(positionName) {
        const pos = {
            id: crypto.randomUUID(),
            name: positionName,
        };
        this.positions.push(pos);
        return pos;
    }

    /**
     * 
     * @param {PositionEntity} position
     * @returns {Promise<void>} 
     */
    async modifyPosition(position) {
        const pos = this.positions.find((p) => p.id === position.id);
        if(pos) {
            pos.name = position.name;
            return true;
        }
        return false;
    }

    /**
     * 
     * @param {string} id 
     */
    async deletePosition(id) {
        const idx = this.positions.findIndex((p) => p.id === id);
        if(idx !== -1) {
            this.positions.splice(idx, 1);
            return true;
        }
        return false;
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
