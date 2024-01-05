// API routes
const express = require('express');
const router = express.Router();

router.get('/users', (req, res) => {
    res.json({ users: [] });
});

router.get('/posts', (req, res) => {
    res.json({ posts: [] });
});

module.exports = router;
