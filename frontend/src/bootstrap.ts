import fs from "node:fs/promises";
import path from "node:path";

const componentsDir = path.join(process.cwd(), "public", "js", "components");
const htmlSourcePattern = /\.innerHTML = `((?:.|(\r)?\n)*)`/;

export async function bootstrap(): Promise<void> {
    const jsComponents = await fs.readdir(componentsDir)
        .then((components) => components.filter((c) => c.endsWith(".js")));

    for (const component of jsComponents) {
        const componentFile = Bun.file(path.join(componentsDir, component));
        let contents = await componentFile.text();

        const htmlComponentContent = contents.match(htmlSourcePattern);

        if (htmlComponentContent === null) {
            return;
        }
        
        const htmlComponentName = component.split(".").slice(0, -1).join('') + ".html";
        const htmlComponent = await Bun.file(path.join(componentsDir, htmlComponentName)).text();

        if(htmlComponent === htmlComponentContent[1]) {
            return;
        }

        contents = contents.replace(htmlComponentContent[1], htmlComponent);
        await Bun.write(componentFile, contents);
    }
}
