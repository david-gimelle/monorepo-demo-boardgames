import express, { Application } from 'express';
import cors from 'cors';
import router from './routes';
import config from '../config';

const app: Application = express();
const port: number = config.port;
const corsAllowedOrigin: string = config.corsAllowedOrigin;


app.use(cors({
  origin: corsAllowedOrigin, // Allow requests from this origin
}));

app.use('/', router);

app.listen(port, () => {
  console.log(`Nodejs Boardgames app listening at http://localhost:${port}`);
});