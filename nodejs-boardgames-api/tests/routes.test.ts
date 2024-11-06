import request from 'supertest';
import express, { Application } from 'express';
import routes from '../src/routes';

const app: Application = express();
app.use('/', routes);

describe('GET /ping', () => {
  it('should return Ping', async () => {
    const res = await request(app).get('/ping');
    expect(res.statusCode).toEqual(200);
    expect(res.text).toBe('Ping');
  });
});

describe('GET /boardgames', () => {
  it('should return an array of board games', async () => {
    const res = await request(app).get('/boardgames');
    expect(res.statusCode).toEqual(200);
    expect(res.body).toEqual([
      { name: "Ticket to ride", origin: "Node App", played: false },
      { name: "Pandemic", origin: "Node App", played: false }
    ]);
  });
});