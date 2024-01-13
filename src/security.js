// Security middleware
const helmet = require('helmet');
const cors = require('cors');

function setupSecurity(app) {
    app.use(helmet());
    app.use(cors({
        origin: process.env.ALLOWED_ORIGINS?.split(','),
        credentials: true
    }));
}

module.exports = setupSecurity;
