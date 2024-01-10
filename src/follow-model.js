// Follow/follower system
class FollowModel {
    constructor(db) {
        this.db = db;
    }

    async follow(followerId, followeeId) {
        return this.db.query('INSERT INTO follows...');
    }

    async unfollow(followerId, followeeId) {
        return this.db.query('DELETE FROM follows...');
    }

    async getFollowers(userId) {
        return this.db.query(\`SELECT * FROM follows WHERE followee_id = ${ userId }\`);
    }

    async getFollowing(userId) {
        return this.db.query(\`SELECT * FROM follows WHERE follower_id = ${ userId }\`);
    }
}

module.exports = FollowModel;
