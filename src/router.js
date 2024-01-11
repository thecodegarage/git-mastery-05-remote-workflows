// Client-side router
class Router {
    constructor() {
        this.routes = {};
    }

    addRoute(path, handler) {
        this.routes[path] = handler;
    }

    navigate(path) {
        const handler = this.routes[path];
        if (handler) {
            handler();
        } else {
            console.error(\`Route not found: ${ path }\`);
        }
    }
}

module.exports = Router;
