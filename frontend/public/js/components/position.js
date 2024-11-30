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
     * @param {Omit<import("../hr-service").PositionEntity, "id">} newEntity 
     * @returns 
     */
    async save(newEntity) {
        const result = await this.service.modifyPosition({
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
        const result = await this.service.deletePosition(this.entity.id);
        if(result) {
            this.dispatchEvent(new Event("delete")); 
        }
    }
}

class PositionElementFactory {
    /**
     * 
     * @param {Omit<import("../hr-service").PositionEntity, "id">} pos
     * @returns {HTMLTableRowElement} 
     */
    create(pos) {
        const nameData = document.createElement("td");
        nameData.innerHTML = pos.name;
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
