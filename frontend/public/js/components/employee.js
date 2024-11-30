class Employee extends EventTarget {
    /**
     * @type {import("../hr-service").EmployeeEntity}
     */
    entity;

    /**
     * 
     */
    service;

    /**
     * 
     * @param {import("../hr-service").EmployeeEntity} entity 
     * @param {import("../hr-service").HrService} service
     */
    constructor(entity, service) {
        super();
        this.service = service;
        this.entity = entity;
    }

    /** @returns {string} */
    getLastname() {
        return this.entity.lastname;
    }

    /** @returns {string} */
    getFirstname() {
        return this.entity.firstname;
    }

    /** @returns {string} */
    getFathername() {
        return this.entity.fathername;
    }

    /** @returns {string} */
    getPhone() {
        return this.entity.phone;
    }

    /** @returns {string} */
    getEmail() {
        return this.entity.email;
    }

    /** @returns {string} */
    getPost() {
        return this.entity.post;
    }

    /** @returns {string} */
    getService() {
        return this.entity.service;
    }

    /** @returns {string} */
    getHiredate() {
        return this.entity.hiredate;
    }

    /** @returns {string|null} */
    getFiredate() {
        return this.entity.firedate;
    }

    /**
         * 
         * @param {Omit<import("../hr-service").EmployeeEntity, "id">} newEntity 
         * @returns 
         */
    async save(newEntity) {
        const result = await this.service.modifyEmployee({
            id: this.entity.id,
            ...newEntity
        });

        if (result) {
            this.entity = result;
            this.dispatchEvent(new Event("save"));
        }
    }

    /**
     * 
     */
    async delete() {
        const result = await this.service.deleteEmployee(this.entity.id);
        if (result) {
            this.dispatchEvent(new Event("delete"));
        }
    }
}


class EmployeeElementFactory {
    /**
     * @param {Omit<import("../hr-service").EmployeeEntity, "id">} employee
     * @returns {HTMLTableRowElement}
    */
    create(employee) {
        const row = document.createElement('tr');

        const properties = [
            employee.lastname,
            employee.firstname,
            employee.fathername,
            employee.phone,
            employee.email,
            employee.post,
            employee.service,
            employee.hiredate,
            employee.firedate
        ];

        properties.forEach(prop => {
            const td = document.createElement('td');
            td.innerHTML = prop !== null ? prop : '';
            td.contentEditable = true;
            row.appendChild(td);
        });

        const modifyData = document.createElement("td");
        const modifyButton = document.createElement("button");
        modifyButton.classList.add("save-button");
        modifyButton.classList.add("mini");
        modifyButton.innerHTML = "Сохранить";
        modifyData.appendChild(modifyButton);

        const deleteData = document.createElement("td");
        const deleteButton = document.createElement("button");
        deleteButton.classList.add("delete-button");
        deleteButton.classList.add("mini");
        deleteButton.innerHTML = "Удалить";
        deleteData.appendChild(deleteButton);

        row.appendChild(modifyData);
        row.appendChild(deleteData);

        return row;
    }
}
