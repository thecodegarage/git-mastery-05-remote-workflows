// Express server
const express = require('express');
const app = express();
const PORT = 3000;

app.get('/', (req, res) => {
    res.json({ message: 'Welcome to the API' });
});

app.listen(PORT, () => {
    console.log(\`Server running on port ${ PORT }\`);
});

module.exports = app;
