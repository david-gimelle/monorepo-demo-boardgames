import express, { Request, Response } from 'express';
const router = express.Router();

interface BoardGame {
  name: '',
  origin: '',
  played: false
};

const defaultBoardGame: BoardGame = {
  name: '',
  origin: '',
  played: false
};

router.get('/ping', (req: Request, res: Response) => {
  res.send('Pong');
});

router.get('/health', (req: Request, res: Response) => {
  res.send('Healthy');
});

router.get('/boardgames', (req: Request, res: Response) => {
  const boardgames = [
    { ...defaultBoardGame, name: "Ticket to ride", origin: "Node App", played: false },
    { ...defaultBoardGame, name: "Pandemic", origin: "Node App", played: false }
  ];
  res.json(boardgames);
});

export default router;