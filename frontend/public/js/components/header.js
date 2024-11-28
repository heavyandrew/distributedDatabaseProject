class Header extends HTMLElement {
    connectedCallback() {
        const shadowRoot = this.attachShadow({ mode: "closed" });
        const headerTemplate = this.create();
        shadowRoot.appendChild(headerTemplate.content.cloneNode(true));
    }

    create() {
        const headerTemplate = document.createElement("template");
        headerTemplate.innerHTML = `<style>
    header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        height: 5vh;
        padding: 10px 20px;
        background-color: #007BFF;
        color: white;
    }

    .title {
        font-family: Arial, sans-serif;
        font-size: 24px;
    }

    .home-button {
        padding: 10px 15px;
        background-color: #0056b3;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s;
    }

    .home-button:hover {
        background-color: #004494;
    }
</style>
<header>
    <div class="title">__Title__</div>
    <button class="home-button" onclick="window.location.href = '/'">На главную</button>
</header>`.replace("__Title__", this.getAttribute("title"));

        return headerTemplate;
    }
}

customElements.define("c-header", Header);
