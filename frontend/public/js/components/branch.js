class Branch extends EventTarget {
    /**
     * @type {import("../principal-service").BranchEntity}
     */
    entity;

    /**
     * 
     */
    service;

    /**
     * 
     * @param {import("../principal-service").BranchEntity} entity
     * @param {import("../principal-service").PrincipalService} service
     */
    constructor(entity, service) {
        super();
        this.service = service;
        this.entity = entity;
    }
    
    getId() {
        return this.entity.id;
    }

    getAddress() {
        return this.entity.address;
    }

    getOpeningDate() {
        return this.entity.opening_date;
    }

    getClosingDate() {
        return this.entity.closing_date;
    }

    /**
     * 
     * @param {Omit<import("../principal-service").BranchEntity, "id">} newEntity 
     * @returns 
     */
    async save(newEntity) {
        const result = await this.service.modifyBranch({
            id: this.entity.id,
            ...newEntity
        });

        if(result) {
            this.entity = result;
            this.dispatchEvent(new Event("save"));
        }
    }

    /**
     * 
     */
    async delete() {
        const result = await this.service.deleteBranch(this.entity.id);
        if(result) {
            this.dispatchEvent(new Event("delete")); 
        }
    }
}

class BranchElementFactory {
    /**
     * 
     * @param {Omit<import("../principal-service").BranchEntity, "id">} branch
     * @returns {HTMLTableRowElement} 
     */
    create(branch) {
        const row = document.createElement('tr');

        const properties = [
            branch.address,
            branch.opening_date,
            branch.closing_date
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

class BranchFromElementFactory {
    /**
     * 
     * @param {HTMLTableRowElement} elem
     * @returns {import("../principal-service").BranchEntity} 
     */
    create(elem) {

    }
}
