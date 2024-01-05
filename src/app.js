// Frontend application
class App {
    constructor() {
        this.apiUrl = 'http://localhost:3000';
    }

    async fetchUsers() {
        const response = await fetch(\`${ this.apiUrl }/users\`);
        return response.json();
    }

    async fetchPosts() {
        const response = await fetch(\`${ this.apiUrl }/posts\`);
        return response.json();
    }
}

module.exports = App;
