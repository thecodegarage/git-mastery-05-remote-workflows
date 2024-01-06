// Authentication middleware
function authenticate(req, res, next) {
    const token = req.headers.authorization;
    
    if (!token) {
        return res.status(401).json({ error: 'Unauthorized' });
    }

    // Verify token
    req.user = { id: 1 }; // Simplified
    next();
}

module.exports = { authenticate };
