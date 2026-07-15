#!/bin/bash
set -e

cd "$(dirname "$0")"

echo "🚀 Building remote workflows practice environment..."
echo ""

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if src/ directory already exists
if [ -d "src" ]; then
    echo -e "${YELLOW}⚠️  Warning: Practice environment already exists${NC}"
    read -p "Delete and rebuild? This will reset all practice work. (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Aborting. Run script again when ready to reset."
        exit 1
    fi
    
    echo -e "${BLUE}🧹 Cleaning up existing practice environment...${NC}"
    git reset --hard origin/master 2>/dev/null || git reset --hard HEAD~10 2>/dev/null || true
    rm -rf src/
    git branch | grep -v "^\*" | grep -v "master" | grep -v "main" | xargs -r git branch -D 2>/dev/null || true
    echo -e "${GREEN}✅ Cleanup complete${NC}"
    echo ""
fi

echo -e "${BLUE}📁 Creating project structure...${NC}"
mkdir -p src docs tests

# Create a collaborative web app project
# Team: Frontend + Backend developers working together

# Developer 1: Alice (Backend Lead)
export GIT_AUTHOR_NAME="Alice Johnson"
export GIT_AUTHOR_EMAIL="alice@team.com"
export GIT_COMMITTER_NAME="Alice Johnson"
export GIT_COMMITTER_EMAIL="alice@team.com"

# Commit 1: Initial API setup
export GIT_AUTHOR_DATE="2024-01-05T09:00:00"
export GIT_COMMITTER_DATE="2024-01-05T09:00:00"
cat > src/server.js << 'EOF'
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
EOF
git add src/server.js
git commit -m "Initialize Express server"

# Commit 2: Add routes
export GIT_AUTHOR_DATE="2024-01-05T10:00:00"
export GIT_COMMITTER_DATE="2024-01-05T10:00:00"
cat > src/routes.js << 'EOF'
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
EOF
git add src/routes.js
git commit -m "Add API routes for users and posts"

# Developer 2: Bob (Frontend Lead)
export GIT_AUTHOR_NAME="Bob Smith"
export GIT_AUTHOR_EMAIL="bob@team.com"
export GIT_COMMITTER_NAME="Bob Smith"
export GIT_COMMITTER_EMAIL="bob@team.com"

# Commit 3: Frontend app
export GIT_AUTHOR_DATE="2024-01-05T11:00:00"
export GIT_COMMITTER_DATE="2024-01-05T11:00:00"
cat > src/app.js << 'EOF'
// Frontend application
class App {
    constructor() {
        this.apiUrl = 'http://localhost:3000';
    }

    async fetchUsers() {
        const response = await fetch(\`${ this.apiUrl }/users\`);
        return response.json();
    }

    async fetchPosts() {
        const response = await fetch(\`${ this.apiUrl }/posts\`);
        return response.json();
    }
}

module.exports = App;
EOF
git add src/app.js
git commit -m "Add frontend app with API calls"

# Commit 4: UI components
export GIT_AUTHOR_DATE="2024-01-05T14:00:00"
export GIT_COMMITTER_DATE="2024-01-05T14:00:00"
cat > src/components.js << 'EOF'
// UI Components
const Components = {
    renderUser(user) {
        return \`<div class="user">${ user.name }</div>\`;
    },

    renderPost(post) {
        return \`<div class="post">${ post.title }</div>\`;
    }
};

module.exports = Components;
EOF
git add src/components.js
git commit -m "Add UI component renderers"

# Back to Alice
export GIT_AUTHOR_NAME="Alice Johnson"
export GIT_AUTHOR_EMAIL="alice@team.com"
export GIT_COMMITTER_NAME="Alice Johnson"
export GIT_COMMITTER_EMAIL="alice@team.com"

# Commit 5: Database setup
export GIT_AUTHOR_DATE="2024-01-06T09:00:00"
export GIT_COMMITTER_DATE="2024-01-06T09:00:00"
cat > src/database.js << 'EOF'
// Database connection
class Database {
    constructor() {
        this.connection = null;
    }

    connect() {
        console.log('Connecting to database...');
        this.connection = { connected: true };
    }

    query(sql) {
        if (!this.connection) {
            throw new Error('Not connected');
        }
        return [];
    }
}

module.exports = Database;
EOF
git add src/database.js
git commit -m "Add database connection module"

# Commit 6: User model
export GIT_AUTHOR_DATE="2024-01-06T10:00:00"
export GIT_COMMITTER_DATE="2024-01-06T10:00:00"
cat > src/user-model.js << 'EOF'
// User model
class UserModel {
    constructor(db) {
        this.db = db;
    }

    async findAll() {
        return this.db.query('SELECT * FROM users');
    }

    async findById(id) {
        return this.db.query(\`SELECT * FROM users WHERE id = ${ id }\`);
    }

    async create(userData) {
        return this.db.query('INSERT INTO users...');
    }
}

module.exports = UserModel;
EOF
git add src/user-model.js
git commit -m "Add User model with CRUD operations"

# Developer 3: Carol (Backend)
export GIT_AUTHOR_NAME="Carol Davis"
export GIT_AUTHOR_EMAIL="carol@team.com"
export GIT_COMMITTER_NAME="Carol Davis"
export GIT_COMMITTER_EMAIL="carol@team.com"

# Commit 7: Post model
export GIT_AUTHOR_DATE="2024-01-06T11:00:00"
export GIT_COMMITTER_DATE="2024-01-06T11:00:00"
cat > src/post-model.js << 'EOF'
// Post model
class PostModel {
    constructor(db) {
        this.db = db;
    }

    async findAll() {
        return this.db.query('SELECT * FROM posts');
    }

    async findByAuthor(authorId) {
        return this.db.query(\`SELECT * FROM posts WHERE author_id = ${ authorId }\`);
    }

    async create(postData) {
        return this.db.query('INSERT INTO posts...');
    }
}

module.exports = PostModel;
EOF
git add src/post-model.js
git commit -m "Add Post model"

# Commit 8: Auth middleware
export GIT_AUTHOR_DATE="2024-01-06T14:00:00"
export GIT_COMMITTER_DATE="2024-01-06T14:00:00"
cat > src/auth-middleware.js << 'EOF'
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
EOF
git add src/auth-middleware.js
git commit -m "Add authentication middleware"

# Back to Bob (Frontend)
export GIT_AUTHOR_NAME="Bob Smith"
export GIT_AUTHOR_EMAIL="bob@team.com"
export GIT_COMMITTER_NAME="Bob Smith"
export GIT_COMMITTER_EMAIL="bob@team.com"

# Commit 9: Add styles
export GIT_AUTHOR_DATE="2024-01-07T09:00:00"
export GIT_COMMITTER_DATE="2024-01-07T09:00:00"
cat > src/styles.css << 'EOF'
/* Main styles */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 20px;
    background-color: #f5f5f5;
}

.user, .post {
    background: white;
    padding: 15px;
    margin: 10px 0;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}
EOF
git add src/styles.css
git commit -m "Add CSS styles"

# Commit 10: Update components
export GIT_AUTHOR_DATE="2024-01-07T10:00:00"
export GIT_COMMITTER_DATE="2024-01-07T10:00:00"
cat >> src/components.js << 'EOF'

    renderUserList(users) {
        return \`<div class="user-list">
            ${ users.map(u => this.renderUser(u)).join('') }
        </div>\`;
    },

    renderPostList(posts) {
        return \`<div class="post-list">
            ${ posts.map(p => this.renderPost(p)).join('') }
        </div>\`;
    }
};

module.exports = Components;
EOF
git add src/components.js
git commit -m "Add list rendering to components"

# Developer 4: Dave (DevOps)
export GIT_AUTHOR_NAME="Dave Wilson"
export GIT_AUTHOR_EMAIL="dave@team.com"
export GIT_COMMITTER_NAME="Dave Wilson"
export GIT_COMMITTER_EMAIL="dave@team.com"

# Commit 11: Docker setup
export GIT_AUTHOR_DATE="2024-01-07T11:00:00"
export GIT_COMMITTER_DATE="2024-01-07T11:00:00"
cat > Dockerfile << 'EOF'
FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 3000

CMD ["node", "src/server.js"]
EOF
git add Dockerfile
git commit -m "Add Dockerfile for containerization"

# Commit 12: Docker compose
export GIT_AUTHOR_DATE="2024-01-07T14:00:00"
export GIT_COMMITTER_DATE="2024-01-07T14:00:00"
cat > docker-compose.yml << 'EOF'
version: '3.8'
services:
  app:
    build: .
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=production
      - DB_HOST=db
    depends_on:
      - db
  
  db:
    image: postgres:15
    environment:
      - POSTGRES_DB=myapp
      - POSTGRES_USER=admin
      - POSTGRES_PASSWORD=secret
EOF
git add docker-compose.yml
git commit -m "Add Docker Compose configuration"

# Back to Alice
export GIT_AUTHOR_NAME="Alice Johnson"
export GIT_AUTHOR_EMAIL="alice@team.com"
export GIT_COMMITTER_NAME="Alice Johnson"
export GIT_COMMITTER_EMAIL="alice@team.com"

# Commit 13: Config module
export GIT_AUTHOR_DATE="2024-01-08T09:00:00"
export GIT_COMMITTER_DATE="2024-01-08T09:00:00"
cat > src/config.js << 'EOF'
// Configuration
const config = {
    port: process.env.PORT || 3000,
    dbHost: process.env.DB_HOST || 'localhost',
    dbPort: process.env.DB_PORT || 5432,
    jwtSecret: process.env.JWT_SECRET || 'dev-secret',
    nodeEnv: process.env.NODE_ENV || 'development'
};

module.exports = config;
EOF
git add src/config.js
git commit -m "Add configuration module"

# Commit 14: Error handler
export GIT_AUTHOR_DATE="2024-01-08T10:00:00"
export GIT_COMMITTER_DATE="2024-01-08T10:00:00"
cat > src/error-handler.js << 'EOF'
// Error handling middleware
function errorHandler(err, req, res, next) {
    console.error(err.stack);
    
    res.status(err.status || 500).json({
        error: {
            message: err.message,
            ...(process.env.NODE_ENV === 'development' && { stack: err.stack })
        }
    });
}

module.exports = errorHandler;
EOF
git add src/error-handler.js
git commit -m "Add global error handler"

# Carol continues
export GIT_AUTHOR_NAME="Carol Davis"
export GIT_AUTHOR_EMAIL="carol@team.com"
export GIT_COMMITTER_NAME="Carol Davis"
export GIT_COMMITTER_EMAIL="carol@team.com"

# Commit 15: Comment model
export GIT_AUTHOR_DATE="2024-01-08T11:00:00"
export GIT_COMMITTER_DATE="2024-01-08T11:00:00"
cat > src/comment-model.js << 'EOF'
// Comment model
class CommentModel {
    constructor(db) {
        this.db = db;
    }

    async findByPostId(postId) {
        return this.db.query(\`SELECT * FROM comments WHERE post_id = ${ postId }\`);
    }

    async create(commentData) {
        return this.db.query('INSERT INTO comments...');
    }

    async delete(id) {
        return this.db.query(\`DELETE FROM comments WHERE id = ${ id }\`);
    }
}

module.exports = CommentModel;
EOF
git add src/comment-model.js
git commit -m "Add Comment model for post comments"

# Commit 16: Validation utils
export GIT_AUTHOR_DATE="2024-01-08T14:00:00"
export GIT_COMMITTER_DATE="2024-01-08T14:00:00"
cat > src/validators.js << 'EOF'
// Validation utilities
const validators = {
    email(email) {
        return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
    },

    password(password) {
        return password.length >= 8;
    },

    username(username) {
        return username.length >= 3 && /^[a-zA-Z0-9_]+$/.test(username);
    }
};

module.exports = validators;
EOF
git add src/validators.js
git commit -m "Add input validation utilities"

# Bob adds more frontend
export GIT_AUTHOR_NAME="Bob Smith"
export GIT_AUTHOR_EMAIL="bob@team.com"
export GIT_COMMITTER_NAME="Bob Smith"
export GIT_COMMITTER_EMAIL="bob@team.com"

# Commit 17: Form handler
export GIT_AUTHOR_DATE="2024-01-09T09:00:00"
export GIT_COMMITTER_DATE="2024-01-09T09:00:00"
cat > src/forms.js << 'EOF'
// Form handling
class FormHandler {
    constructor() {
        this.forms = new Map();
    }

    handleSubmit(formId, callback) {
        const form = document.getElementById(formId);
        form.addEventListener('submit', (e) => {
            e.preventDefault();
            const formData = new FormData(form);
            const data = Object.fromEntries(formData);
            callback(data);
        });
    }
}

module.exports = FormHandler;
EOF
git add src/forms.js
git commit -m "Add form handling utilities"

# Commit 18: State management
export GIT_AUTHOR_DATE="2024-01-09T10:00:00"
export GIT_COMMITTER_DATE="2024-01-09T10:00:00"
cat > src/state.js << 'EOF'
// State management
class StateManager {
    constructor() {
        this.state = {};
        this.listeners = [];
    }

    setState(newState) {
        this.state = { ...this.state, ...newState };
        this.notifyListeners();
    }

    getState() {
        return this.state;
    }

    subscribe(listener) {
        this.listeners.push(listener);
        return () => {
            this.listeners = this.listeners.filter(l => l !== listener);
        };
    }

    notifyListeners() {
        this.listeners.forEach(listener => listener(this.state));
    }
}

module.exports = StateManager;
EOF
git add src/state.js
git commit -m "Add state management system"

# Alice adds testing
export GIT_AUTHOR_NAME="Alice Johnson"
export GIT_AUTHOR_EMAIL="alice@team.com"
export GIT_COMMITTER_NAME="Alice Johnson"
export GIT_COMMITTER_EMAIL="alice@team.com"

# Commit 19: Test setup
export GIT_AUTHOR_DATE="2024-01-09T11:00:00"
export GIT_COMMITTER_DATE="2024-01-09T11:00:00"
cat > tests/setup.js << 'EOF'
// Test setup
const chai = require('chai');
const chaiHttp = require('chai-http');

chai.use(chaiHttp);

global.expect = chai.expect;
global.request = chai.request;
EOF
git add tests/setup.js
git commit -m "Add test setup configuration"

# Commit 20: API tests
export GIT_AUTHOR_DATE="2024-01-09T14:00:00"
export GIT_COMMITTER_DATE="2024-01-09T14:00:00"
cat > tests/api.test.js << 'EOF'
// API tests
describe('API Endpoints', () => {
    describe('GET /users', () => {
        it('should return list of users', async () => {
            const res = await request(app).get('/users');
            expect(res).to.have.status(200);
            expect(res.body).to.have.property('users');
        });
    });

    describe('GET /posts', () => {
        it('should return list of posts', async () => {
            const res = await request(app).get('/posts');
            expect(res).to.have.status(200);
            expect(res.body).to.have.property('posts');
        });
    });
});
EOF
git add tests/api.test.js
git commit -m "Add API endpoint tests"

# Dave adds CI/CD
export GIT_AUTHOR_NAME="Dave Wilson"
export GIT_AUTHOR_EMAIL="dave@team.com"
export GIT_COMMITTER_NAME="Dave Wilson"
export GIT_COMMITTER_EMAIL="dave@team.com"

# Commit 21: GitHub Actions
export GIT_AUTHOR_DATE="2024-01-10T09:00:00"
export GIT_COMMITTER_DATE="2024-01-10T09:00:00"
mkdir -p .github/workflows
cat > .github/workflows/ci.yml << 'EOF'
name: CI

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    
    steps:
      - uses: actions/checkout@v3
      - name: Setup Node
        uses: actions/setup-node@v3
        with:
          node-version: '18'
      - run: npm install
      - run: npm test
      - run: npm run lint
EOF
git add .github/workflows/ci.yml
git commit -m "Add GitHub Actions CI pipeline"

# Commit 22: Linting config
export GIT_AUTHOR_DATE="2024-01-10T10:00:00"
export GIT_COMMITTER_DATE="2024-01-10T10:00:00"
cat > .eslintrc.json << 'EOF'
{
  "env": {
    "node": true,
    "es2021": true
  },
  "extends": "eslint:recommended",
  "rules": {
    "indent": ["error", 2],
    "quotes": ["error", "single"],
    "semi": ["error", "always"]
  }
}
EOF
git add .eslintrc.json
git commit -m "Add ESLint configuration"

# Carol adds more features
export GIT_AUTHOR_NAME="Carol Davis"
export GIT_AUTHOR_EMAIL="carol@team.com"
export GIT_COMMITTER_NAME="Carol Davis"
export GIT_COMMITTER_EMAIL="carol@team.com"

# Commit 23: Like system
export GIT_AUTHOR_DATE="2024-01-10T11:00:00"
export GIT_COMMITTER_DATE="2024-01-10T11:00:00"
cat > src/like-model.js << 'EOF'
// Like/reaction system
class LikeModel {
    constructor(db) {
        this.db = db;
    }

    async addLike(userId, postId) {
        return this.db.query('INSERT INTO likes...');
    }

    async removeLike(userId, postId) {
        return this.db.query('DELETE FROM likes...');
    }

    async getLikeCount(postId) {
        const result = await this.db.query(\`SELECT COUNT(*) FROM likes WHERE post_id = ${ postId }\`);
        return result[0].count;
    }
}

module.exports = LikeModel;
EOF
git add src/like-model.js
git commit -m "Add like/reaction system"

# Commit 24: Follow system
export GIT_AUTHOR_DATE="2024-01-10T14:00:00"
export GIT_COMMITTER_DATE="2024-01-10T14:00:00"
cat > src/follow-model.js << 'EOF'
// Follow/follower system
class FollowModel {
    constructor(db) {
        this.db = db;
    }

    async follow(followerId, followeeId) {
        return this.db.query('INSERT INTO follows...');
    }

    async unfollow(followerId, followeeId) {
        return this.db.query('DELETE FROM follows...');
    }

    async getFollowers(userId) {
        return this.db.query(\`SELECT * FROM follows WHERE followee_id = ${ userId }\`);
    }

    async getFollowing(userId) {
        return this.db.query(\`SELECT * FROM follows WHERE follower_id = ${ userId }\`);
    }
}

module.exports = FollowModel;
EOF
git add src/follow-model.js
git commit -m "Add follow/follower functionality"

# Bob adds more UI
export GIT_AUTHOR_NAME="Bob Smith"
export GIT_AUTHOR_EMAIL="bob@team.com"
export GIT_COMMITTER_NAME="Bob Smith"
export GIT_COMMITTER_EMAIL="bob@team.com"

# Commit 25: Router
export GIT_AUTHOR_DATE="2024-01-11T09:00:00"
export GIT_COMMITTER_DATE="2024-01-11T09:00:00"
cat > src/router.js << 'EOF'
// Client-side router
class Router {
    constructor() {
        this.routes = {};
    }

    addRoute(path, handler) {
        this.routes[path] = handler;
    }

    navigate(path) {
        const handler = this.routes[path];
        if (handler) {
            handler();
        } else {
            console.error(\`Route not found: ${ path }\`);
        }
    }
}

module.exports = Router;
EOF
git add src/router.js
git commit -m "Add client-side routing"

# Commit 26: Navigation component
export GIT_AUTHOR_DATE="2024-01-11T10:00:00"
export GIT_COMMITTER_DATE="2024-01-11T10:00:00"
cat > src/navigation.js << 'EOF'
// Navigation component
const Navigation = {
    render() {
        return \`
            <nav class="main-nav">
                <a href="/">Home</a>
                <a href="/users">Users</a>
                <a href="/posts">Posts</a>
                <a href="/profile">Profile</a>
            </nav>
        \`;
    }
};

module.exports = Navigation;
EOF
git add src/navigation.js
git commit -m "Add navigation component"

# Alice adds more backend
export GIT_AUTHOR_NAME="Alice Johnson"
export GIT_AUTHOR_EMAIL="alice@team.com"
export GIT_COMMITTER_NAME="Alice Johnson"
export GIT_COMMITTER_EMAIL="alice@team.com"

# Commit 27: Rate limiter
export GIT_AUTHOR_DATE="2024-01-11T11:00:00"
export GIT_COMMITTER_DATE="2024-01-11T11:00:00"
cat > src/rate-limiter.js << 'EOF'
// Rate limiting middleware
const rateLimit = require('express-rate-limit');

const limiter = rateLimit({
    windowMs: 15 * 60 * 1000, // 15 minutes
    max: 100, // limit each IP to 100 requests per windowMs
    message: 'Too many requests'
});

module.exports = limiter;
EOF
git add src/rate-limiter.js
git commit -m "Add rate limiting middleware"

# Commit 28: Logger
export GIT_AUTHOR_DATE="2024-01-11T14:00:00"
export GIT_COMMITTER_DATE="2024-01-11T14:00:00"
cat > src/logger.js << 'EOF'
// Logging utility
const winston = require('winston');

const logger = winston.createLogger({
    level: 'info',
    format: winston.format.json(),
    transports: [
        new winston.transports.File({ filename: 'error.log', level: 'error' }),
        new winston.transports.File({ filename: 'combined.log' })
    ]
});

if (process.env.NODE_ENV !== 'production') {
    logger.add(new winston.transports.Console({
        format: winston.format.simple()
    }));
}

module.exports = logger;
EOF
git add src/logger.js
git commit -m "Add Winston logger configuration"

# Dave adds more DevOps
export GIT_AUTHOR_NAME="Dave Wilson"
export GIT_AUTHOR_EMAIL="dave@team.com"
export GIT_COMMITTER_NAME="Dave Wilson"
export GIT_COMMITTER_EMAIL="dave@team.com"

# Commit 29: Nginx config
export GIT_AUTHOR_DATE="2024-01-12T09:00:00"
export GIT_COMMITTER_DATE="2024-01-12T09:00:00"
cat > nginx.conf << 'EOF'
server {
    listen 80;
    server_name example.com;

    location / {
        proxy_pass http://app:3000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }

    location /static {
        alias /app/public;
    }
}
EOF
git add nginx.conf
git commit -m "Add Nginx reverse proxy configuration"

# Commit 30: Health check
export GIT_AUTHOR_DATE="2024-01-12T10:00:00"
export GIT_COMMITTER_DATE="2024-01-12T10:00:00"
cat > src/health.js << 'EOF'
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
EOF
git add src/health.js
git commit -m "Add health check endpoint"

# Carol adds caching
export GIT_AUTHOR_NAME="Carol Davis"
export GIT_AUTHOR_EMAIL="carol@team.com"
export GIT_COMMITTER_NAME="Carol Davis"
export GIT_COMMITTER_EMAIL="carol@team.com"

# Commit 31: Redis cache
export GIT_AUTHOR_DATE="2024-01-12T11:00:00"
export GIT_COMMITTER_DATE="2024-01-12T11:00:00"
cat > src/cache.js << 'EOF'
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
EOF
git add src/cache.js
git commit -m "Add Redis caching layer"

# Commit 32: Session store
export GIT_AUTHOR_DATE="2024-01-12T14:00:00"
export GIT_COMMITTER_DATE="2024-01-12T14:00:00"
cat > src/session-store.js << 'EOF'
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
EOF
git add src/session-store.js
git commit -m "Add Redis-backed session store"

# Alice adds security
export GIT_AUTHOR_NAME="Alice Johnson"
export GIT_AUTHOR_EMAIL="alice@team.com"
export GIT_COMMITTER_NAME="Alice Johnson"
export GIT_COMMITTER_EMAIL="alice@team.com"

# Commit 33: Security headers
export GIT_AUTHOR_DATE="2024-01-13T09:00:00"
export GIT_COMMITTER_DATE="2024-01-13T09:00:00"
cat > src/security.js << 'EOF'
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
EOF
git add src/security.js
git commit -m "Add security headers and CORS"

# Commit 34: Input sanitization
export GIT_AUTHOR_DATE="2024-01-13T10:00:00"
export GIT_COMMITTER_DATE="2024-01-13T10:00:00"
cat > src/sanitizer.js << 'EOF'
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
EOF
git add src/sanitizer.js
git commit -m "Add input sanitization utilities"

# Bob adds final UI touches
export GIT_AUTHOR_NAME="Bob Smith"
export GIT_AUTHOR_EMAIL="bob@team.com"
export GIT_COMMITTER_NAME="Bob Smith"
export GIT_COMMITTER_EMAIL="bob@team.com"

# Commit 35: Modal component
export GIT_AUTHOR_DATE="2024-01-13T11:00:00"
export GIT_COMMITTER_DATE="2024-01-13T11:00:00"
cat > src/modal.js << 'EOF'
// Modal component
class Modal {
    constructor() {
        this.isOpen = false;
    }

    open(content) {
        this.isOpen = true;
        document.body.innerHTML += \`
            <div class="modal-overlay">
                <div class="modal-content">
                    ${ content }
                    <button onclick="modal.close()">Close</button>
                </div>
            </div>
        \`;
    }

    close() {
        this.isOpen = false;
        document.querySelector('.modal-overlay')?.remove();
    }
}

module.exports = Modal;
EOF
git add src/modal.js
git commit -m "Add modal component"

# Commit 36: Notification system
export GIT_AUTHOR_DATE="2024-01-13T14:00:00"
export GIT_COMMITTER_DATE="2024-01-13T14:00:00"
cat > src/notifications.js << 'EOF'
// Toast notification system
class NotificationManager {
    show(message, type = 'info') {
        const notification = document.createElement('div');
        notification.className = \`notification notification-${ type }\`;
        notification.textContent = message;
        
        document.body.appendChild(notification);
        
        setTimeout(() => {
            notification.remove();
        }, 3000);
    }

    success(message) {
        this.show(message, 'success');
    }

    error(message) {
        this.show(message, 'error');
    }
}

module.exports = NotificationManager;
EOF
git add src/notifications.js
git commit -m "Add toast notification system"

# Dave adds monitoring
export GIT_AUTHOR_NAME="Dave Wilson"
export GIT_AUTHOR_EMAIL="dave@team.com"
export GIT_COMMITTER_NAME="Dave Wilson"
export GIT_COMMITTER_EMAIL="dave@team.com"

# Commit 37: Metrics
export GIT_AUTHOR_DATE="2024-01-14T09:00:00"
export GIT_COMMITTER_DATE="2024-01-14T09:00:00"
cat > src/metrics.js << 'EOF'
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
EOF
git add src/metrics.js
git commit -m "Add Prometheus metrics"

# Commit 38: Documentation
export GIT_AUTHOR_DATE="2024-01-14T10:00:00"
export GIT_COMMITTER_DATE="2024-01-14T10:00:00"
cat > docs/API.md << 'EOF'
# API Documentation

## Endpoints

### Users
- `GET /users` - List all users
- `GET /users/:id` - Get user by ID
- `POST /users` - Create new user
- `PUT /users/:id` - Update user
- `DELETE /users/:id` - Delete user

### Posts
- `GET /posts` - List all posts
- `GET /posts/:id` - Get post by ID
- `POST /posts` - Create new post
- `PUT /posts/:id` - Update post
- `DELETE /posts/:id` - Delete post

### Authentication
- `POST /auth/login` - Login
- `POST /auth/logout` - Logout
- `POST /auth/register` - Register new user
EOF
git add docs/API.md
git commit -m "Add comprehensive API documentation"

# Alice adds final touches
export GIT_AUTHOR_NAME="Alice Johnson"
export GIT_AUTHOR_EMAIL="alice@team.com"
export GIT_COMMITTER_NAME="Alice Johnson"
export GIT_COMMITTER_EMAIL="alice@team.com"

# Commit 39: Package.json
export GIT_AUTHOR_DATE="2024-01-14T11:00:00"
export GIT_COMMITTER_DATE="2024-01-14T11:00:00"
cat > package.json << 'EOF'
{
  "name": "collaborative-web-app",
  "version": "1.0.0",
  "description": "Full-stack collaborative web application",
  "main": "src/server.js",
  "scripts": {
    "start": "node src/server.js",
    "dev": "nodemon src/server.js",
    "test": "mocha tests/**/*.test.js",
    "lint": "eslint src/**/*.js"
  },
  "keywords": ["express", "api", "web-app"],
  "author": "Development Team",
  "license": "MIT"
}
EOF
git add package.json
git commit -m "Add package.json with scripts"

# Commit 40: README
export GIT_AUTHOR_DATE="2024-01-14T14:00:00"
export GIT_COMMITTER_DATE="2024-01-14T14:00:00"
cat > README.md << 'EOF'
# Collaborative Web Application

A full-stack web application built collaboratively by a team of developers.

## Team Members

- Alice Johnson - Backend Lead
- Bob Smith - Frontend Lead
- Carol Davis - Backend Developer
- Dave Wilson - DevOps Engineer

## Features

- RESTful API
- User authentication
- Post management
- Comments and likes
- Follow system
- Real-time notifications
- Caching with Redis
- Containerized with Docker

## Getting Started

```bash
npm install
npm start
```

## Development

```bash
docker-compose up
```

## Testing

```bash
npm test
```

## Documentation

See [API.md](docs/API.md) for API documentation.
EOF
git add README.md
git commit -m "Add comprehensive README"

echo ""
echo -e "${GREEN}✅ Setup complete!${NC}"
echo ""
echo -e "${BLUE}📊 Created 40 commits from 4 team members:${NC}"
echo "  • Alice Johnson (Backend Lead) - 13 commits"
echo "  • Bob Smith (Frontend Lead) - 10 commits"
echo "  • Carol Davis (Backend Developer) - 10 commits"
echo "  • Dave Wilson (DevOps Engineer) - 7 commits"
echo ""
echo "Next steps:"
echo "  1. Verify: git log --oneline --all"
echo "  2. Check authors: git shortlog -sn"
echo "  3. Start exercises: open EXERCISES.md"
echo ""
echo "To reset and start over, just run ./build-history.sh again"
