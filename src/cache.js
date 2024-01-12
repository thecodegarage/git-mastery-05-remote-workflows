// Redis caching layer
const redis = require('redis');
const client = redis.createClient();

async function getCache(key) {
    return await client.get(key);
}

async function setCache(key, value, ttl = 3600) {
    return await client.setEx(key, ttl, JSON.stringify(value));
}

async function deleteCache(key) {
    return await client.del(key);
}

module.exports = { getCache, setCache, deleteCache };
