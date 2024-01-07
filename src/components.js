// UI Components
const Components = {
    renderUser(user) {
        return \`<div class="user">${ user.name }</div>\`;
    },

    renderPost(post) {
        return \`<div class="post">${ post.title }</div>\`;
    }
};

module.exports = Components;

    renderUserList(users) {
        return \`<div class="user-list">
            ${ users.map(u => this.renderUser(u)).join('') }
        </div>\`;
    },

    renderPostList(posts) {
        return \`<div class="post-list">
            ${ posts.map(p => this.renderPost(p)).join('') }
        </div>\`;
    }
};

module.exports = Components;
