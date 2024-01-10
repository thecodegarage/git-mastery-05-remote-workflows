// Like/reaction system
class LikeModel {
    constructor(db) {
        this.db = db;
    }

    async addLike(userId, postId) {
        return this.db.query('INSERT INTO likes...');
    }

    async removeLike(userId, postId) {
        return this.db.query('DELETE FROM likes...');
    }

    async getLikeCount(postId) {
        const result = await this.db.query(\`SELECT COUNT(*) FROM likes WHERE post_id = ${ postId }\`);
        return result[0].count;
    }
}

module.exports = LikeModel;
