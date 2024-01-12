// Session store
const session = require('express-session');
const RedisStore = require('connect-redis')(session);

const sessionStore = session({
    store: new RedisStore({ client: redisClient }),
    secret: process.env.SESSION_SECRET,
    resave: false,
    saveUninitialized: false,
    cookie: {
        secure: process.env.NODE_ENV === 'production',
        maxAge: 24 * 60 * 60 * 1000
    }
});

module.exports = sessionStore;
