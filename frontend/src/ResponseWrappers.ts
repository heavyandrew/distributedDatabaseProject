export namespace ResponseWrappers {
    const baseWrapper = (type: string) => {
        return async (path: string) => {
            return new Response(await Bun.file(path).bytes(), {
                headers: { "Content-Type": type }
            });
        }
    }

    export const html = baseWrapper("text/html");
    export const xIcon = baseWrapper("image/x-icon");
    export const js = baseWrapper("text/javascript");
}