class PrincipalService {
    /**
     * 
     */
    static instance = new PrincipalService();

    url = "http://localhost/api";

    /**
     * 
     * @returns {HrService}
     */
    static getInstance() {
        return this.instance;
    }

    /**
     * @returns {Promise<ServiceEntity[]>}
     */
    async getServices() {
        const res = await fetch(this.url + "/services", {
            method: "GET",
        });

        this.positionsCache = res.json().then((b) => b.payload);

        return this.positionsCache;
    }

    /**
     * 
     * @param {Omit<ServiceEntity, "id">} service
     * @returns {Promise<ServiceEntity>} 
     */
    async addService(service) {
        const res = await fetch(this.url + "/services", {
            method: "POST",
            body: JSON.stringify(service),
        });

        return res.json().then((b) => b.payload);
    }

    /**
     * 
     * @param {ServiceEntity} service
     * @returns {Promise<ServiceEntity>} 
     */
    async modifyService(service) {
        const res = await fetch(this.url + "/services", {
            method: "PUT",
            body: JSON.stringify({ service },),
        });

        return res.json().then((b) => b.payload);
    }

    /**
     * 
     * @param {number} id 
     */
    async deleteService(id) {
        const res = await fetch(this.url + "/services", {
            method: "DELETE",
            body: JSON.stringify({ id },),
        });

        return res.json((b) => b.payload);
    }

    /**
     * @returns {Promise<BranchEntity[]>}
     */
    async getBranches() {
        const res = await fetch(this.url + "/branches", {
            method: "GET",
        });

        this.positionsCache = res.json().then((b) => b.payload);

        return this.positionsCache;
    }

    /**
     * 
     * @param {Omit<BranchEntity, "id">} branch
     * @returns {Promise<BranchEntity>} 
     */
    async addBranch(branch) {
        const res = await fetch(this.url + "/branches", {
            method: "POST",
            body: JSON.stringify(branch),
        });

        return res.json().then((b) => b.payload);
    }

    /**
     * 
     * @param {BranchEntity} branch
     * @returns {Promise<BranchEntity>} 
     */
    async modifyBranch(branch) {
        const res = await fetch(this.url + "/branches", {
            method: "PUT",
            body: JSON.stringify({ branch },),
        });

        return res.json().then((b) => b.payload);
    }

    /**
     * 
     * @param {number} id 
     */
    async deleteBranch(id) {
        const res = await fetch(this.url + "/branches", {
            method: "DELETE",
            body: JSON.stringify({ id },),
        });

        return res.json((b) => b.payload);
    }

    /**
     * @returns {Promise<OrderStatusEntity[]>}
     */
    async getOrderStatuses() {
        const res = await fetch(this.url + "/order_statuses", {
            method: "GET",
        });

        this.positionsCache = res.json().then((b) => b.payload);

        return this.positionsCache;
    }

    /**
     * 
     * @param {Omit<OrderStatusEntity, "id">} orderStatus
     * @returns {Promise<OrderStatusEntity>} 
     */
    async addOrderStatus(orderStatus) {
        const res = await fetch(this.url + "/order_statuses", {
            method: "POST",
            body: JSON.stringify(orderStatus),
        });

        return res.json().then((b) => b.payload);
    }

    /**
     * 
     * @param {OrderStatusEntity} orderStatus
     * @returns {Promise<OrderStatusEntity>} 
     */
    async modifyOrderStatus(orderStatus) {
        const res = await fetch(this.url + "/order_statuses", {
            method: "PUT",
            body: JSON.stringify({ orderStatus },),
        });

        return res.json().then((b) => b.payload);
    }

    /**
     * 
     * @param {number} id 
     */
    async deleteOrderStatus(id) {
        const res = await fetch(this.url + "/order_statuses", {
            method: "DELETE",
            body: JSON.stringify({ id },),
        });

        return res.json((b) => b.payload);
    }
}

/**
 * @typedef {Object} ServiceEntity 
 * @property {number} id
 * @property {string} name
 * @property {string} description
 * @property {number} price
 */

/**
 * @typedef {Object} BranchEntity 
 * @property {number} id
 * @property {string} address 
 * @property {string} opening_date 
 * @property {number} closing_date
 */

/**
 * @typedef {Object} OrderStatusEntity 
 * @property {number} id
 * @property {number} status 
 */