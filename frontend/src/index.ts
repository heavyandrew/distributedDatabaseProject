import path from "node:path";
import fs from "node:fs";

const html = path.join(process.cwd(), "src", "public", "html");
const manifest = path.join(process.cwd(), "src", "public", "manifest");

const routes = new Set(fs.readdirSync(html));
console.log(routes);

const server = Bun.serve({
    static: {
        "/favicon.ico": new Response(await Bun.file(path.join(manifest, "favicon.ico")).bytes(), {
            headers: {"Content-Type": "image/x-icon"}
        }),
        "/": new Response(await Bun.file(path.join(html, "index.html")).bytes(), {
            headers: {"Content-Type": "text/html"}
        }),
    },

    port: process.env.PORT,

    fetch(req: Request) {
        const url = new URL(req.url);
        if(routes.has(url.pathname.slice(1))) {
            return new Response(Bun.file(path.join(html, url.pathname + ".html")), {
                headers: {
                    "Content-type": "text/html",
                }
            })
        }
        return new Response("404");
    }
});

console.log("Server started on port " + server.port);
