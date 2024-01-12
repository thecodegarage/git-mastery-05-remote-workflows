// Health check endpoint
async function healthCheck(req, res) {
    try {
        // Check database
        await db.query('SELECT 1');
        
        res.json({
            status: 'healthy',
            timestamp: new Date().toISOString(),
            uptime: process.uptime()
        });
    } catch (error) {
        res.status(503).json({
            status: 'unhealthy',
            error: error.message
        });
    }
}

module.exports = healthCheck;
