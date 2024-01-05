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
