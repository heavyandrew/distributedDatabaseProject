class Position extends EventTarget {
    /**
     * @type {import("../hr-service").PositionEntity}
     */
    entity;

    /**
     * 
     */
    service;

    /**
     * 
     * @param {import("../hr-service").PositionEntity} entity 
     * @param {import("../hr-service").HrService} service
     */
    constructor(entity, service) {
        super();
        this.service = service;
        this.entity = entity;
    }

    /**
     * @returns {string}
     */
    getId() {
        return this.entity.id;
    }

    /**
     * @returns {string}
     */
    getName() {
        return this.entity.name;     
    }

    /**
     * 
     * @param {string} value
     * @returns 
     */
    async save(value) {
        const result = await this.service.modifyPosition({
            id: this.entity.id,
            name: value,
        });

        if(result) {
            this.entity.name = value;
            this.dispatchEvent(new Event("save"));
        } else {
            this.rowElem.firstChild.innerHTML = this.entity.name;
        }
    }

    /**
     * 
     */
    async delete() {
        const result = await this.service.deletePosition(this.entity.id);
        if(result) {
            this.dispatchEvent(new Event("delete")); 
        }
    }
}

class PositionElementFactory {
    /**
     * 
     * @param {string} name
     * @returns {HTMLTableRowElement} 
     */
    create(name) {
        const nameData = document.createElement("td");
        nameData.innerHTML = name;
        nameData.contentEditable = true;

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

        const rowElem = document.createElement("tr");
        rowElem.appendChild(nameData);
        rowElem.appendChild(modifyData);
        rowElem.appendChild(deleteData);
        
        return rowElem;
    } 
}
