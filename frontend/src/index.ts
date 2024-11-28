import path from "node:path";
import fs from "node:fs/promises";

import { bootstrap } from "./bootstrap";
import { ResponseWrappers } from "./ResponseWrappers";

const PUBLIC_DIR = path.join(process.cwd(), "public");
const HTML_DIR = path.join(PUBLIC_DIR, "html");
const MANIFEST_DIR = path.join(PUBLIC_DIR, "manifest");

const routes = new Set(await fs.readdir(HTML_DIR));

await bootstrap();
const server = Bun.serve({
    static: {
        "/favicon.ico": await ResponseWrappers.xIcon(path.join(MANIFEST_DIR, "favicon.ico")),
        "/": await ResponseWrappers.html(path.join(HTML_DIR, "index.html")),
        "/css/index.css": await ResponseWrappers.css(path.join(PUBLIC_DIR, "css", "index.css")),
    },
    port: process.env.PORT,
    async fetch(req: Request) {
        const url = new URL(req.url);

        if (url.pathname.endsWith(".js")) {
            const filePath = path.join(PUBLIC_DIR, url.pathname);
            if (await fs.exists(filePath)) {
                return ResponseWrappers.js(path.join(PUBLIC_DIR, url.pathname))
            }
        }

        const route = url.pathname.slice(1) + ".html";
        if (routes.has(route)) {
            return ResponseWrappers.html(path.join(HTML_DIR, route));
        }
        return new Response("404");
    }
});

console.log("Server started on port " + server.port);
