// Configuration
const config = {
    port: process.env.PORT || 3000,
    dbHost: process.env.DB_HOST || 'localhost',
    dbPort: process.env.DB_PORT || 5432,
    jwtSecret: process.env.JWT_SECRET || 'dev-secret',
    nodeEnv: process.env.NODE_ENV || 'development'
};

module.exports = config;
