import express, { Application } from 'express';
import router from './routes';
import config from '../config';

const app: Application = express();
const port: number = config.port;

app.use('/', router);

app.listen(port, () => {
  console.log(`Nodejs Boardgames app listening at http://localhost:${port}`);
});