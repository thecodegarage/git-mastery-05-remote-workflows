// Database connection
class Database {
    constructor() {
        this.connection = null;
    }

    connect() {
        console.log('Connecting to database...');
        this.connection = { connected: true };
    }

    query(sql) {
        if (!this.connection) {
            throw new Error('Not connected');
        }
        return [];
    }
}

module.exports = Database;
