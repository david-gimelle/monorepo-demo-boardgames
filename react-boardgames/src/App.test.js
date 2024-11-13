// App.test.js
import { getInitialBoardGames } from './App';

describe('getInitialBoardGames', () => {
  it('should return an array of initial board games', () => {
    const initialBoardGames = getInitialBoardGames();
    expect(initialBoardGames).toEqual([
      { name: "Catan", origin: "react App", played: false },
      { name: "Splendor", origin: "react App", played: false },
    ]);
  });
});