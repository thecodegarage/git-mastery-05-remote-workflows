// Post model
class PostModel {
    constructor(db) {
        this.db = db;
    }

    async findAll() {
        return this.db.query('SELECT * FROM posts');
    }

    async findByAuthor(authorId) {
        return this.db.query(\`SELECT * FROM posts WHERE author_id = ${ authorId }\`);
    }

    async create(postData) {
        return this.db.query('INSERT INTO posts...');
    }
}

module.exports = PostModel;
