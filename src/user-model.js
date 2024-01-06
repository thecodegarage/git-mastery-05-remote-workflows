// User model
class UserModel {
    constructor(db) {
        this.db = db;
    }

    async findAll() {
        return this.db.query('SELECT * FROM users');
    }

    async findById(id) {
        return this.db.query(\`SELECT * FROM users WHERE id = ${ id }\`);
    }

    async create(userData) {
        return this.db.query('INSERT INTO users...');
    }
}

module.exports = UserModel;
