// Input sanitization
const sanitizeHtml = require('sanitize-html');

function sanitize(input) {
    if (typeof input === 'string') {
        return sanitizeHtml(input, {
            allowedTags: [],
            allowedAttributes: {}
        });
    }
    return input;
}

function sanitizeObject(obj) {
    const sanitized = {};
    for (const key in obj) {
        sanitized[key] = sanitize(obj[key]);
    }
    return sanitized;
}

module.exports = { sanitize, sanitizeObject };
