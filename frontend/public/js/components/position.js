class Position extends EventTarget {
    /**
     * @type {import("../hr-service").PositionEntity}
     */
    entity;

    /**
     * @type {HTMLTableRowElement}
     */
    rowElem;

    /**
     * 
     * @param {import("../hr-service").PositionEntity} entity 
     */
    constructor(entity) {
        this.entity = entity;

        const nameData = document.createElement("td");
        nameData.innerHTML = position.name;

        const modifyData = document.createElement("td");
        const modifyButton = document.createElement("button");
        modifyButton.innerHTML = "Изменить";
        modifyButton.onclick = 
        modifyData.appendChild(modifyButton);

        const deleteData = document.createElement("td");
        const deleteButton = document.createElement("button");
        modifyButton.innerHTML = "Удалить";
        deleteData.appendChild(deleteButton);

        this.rowElem = document.createElement("tr");
        this.rowElem.appendChild(nameData);
        this.rowElem.appendChild(modifyData);
        this.rowElem.appendChild(deleteButton);
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
     * @returns {HTMLTableRowElement}
     */
    getRowElement() {
        return this.rowElem;
    }

    /**
     * 
     * @param {MouseEvent} event 
     * @returns 
     */
    async edit(event) {
        const resp = await fetch("", {
            body: {
                id: this.entity.id,
            }
        });

        if(resp.status !== 200) {
            return;
        }

        this.entity.name = (await resp.json()).name;
        this.dispatchEvent(new Event("edit"));        
    }

    /**
     * 
     */
    async delete() {
        const resp = await fetch("", {
            body: {
                id: this.entity.id,
            }
        });

        if(resp.status !== 200) {
            return;
        }

        this.dispatchEvent(new Event("delete")); 
    }
}
