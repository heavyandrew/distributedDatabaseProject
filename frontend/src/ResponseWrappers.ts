export namespace ResponseWrappers {
    const baseWrapper = (type: string) => {
        return async (path: string, headers?: HeadersInit) => {
            return new Response(await Bun.file(path).bytes(), {
                headers: { ...headers, "Content-Type": type }
            });
        }
    }

    export const html = baseWrapper("text/html");
    export const xIcon = baseWrapper("image/x-icon");
    export const js = baseWrapper("text/javascript");
    export const css = baseWrapper("text/css");
}