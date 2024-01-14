// Prometheus metrics
const client = require('prom-client');

const register = new client.Registry();

const httpRequestDuration = new client.Histogram({
    name: 'http_request_duration_seconds',
    help: 'Duration of HTTP requests in seconds',
    labelNames: ['method', 'route', 'status']
});

register.registerMetric(httpRequestDuration);

module.exports = { register, httpRequestDuration };
