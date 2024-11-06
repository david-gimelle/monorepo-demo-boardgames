import express, { Application } from 'express';
import router from './routes';

const app: Application = express();
const port: number = parseInt(process.env.PORT || '3000', 10);

app.use('/', router);

app.listen(port, () => {
  console.log(`Nodejs Boardgames app listening at http://localhost:${port}`);
});