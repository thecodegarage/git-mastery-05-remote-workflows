// Comment model
class CommentModel {
    constructor(db) {
        this.db = db;
    }

    async findByPostId(postId) {
        return this.db.query(\`SELECT * FROM comments WHERE post_id = ${ postId }\`);
    }

    async create(commentData) {
        return this.db.query('INSERT INTO comments...');
    }

    async delete(id) {
        return this.db.query(\`DELETE FROM comments WHERE id = ${ id }\`);
    }
}

module.exports = CommentModel;
