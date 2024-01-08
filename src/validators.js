// Validation utilities
const validators = {
    email(email) {
        return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
    },

    password(password) {
        return password.length >= 8;
    },

    username(username) {
        return username.length >= 3 && /^[a-zA-Z0-9_]+$/.test(username);
    }
};

module.exports = validators;
