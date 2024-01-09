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
