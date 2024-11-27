import React from 'react';
import App, { getInitialBoardGames } from '../src/App';

test('getInitialBoardGames returns the correct initial board games', () => {
  const expectedBoardGames = [
    { name: "Catan", origin: "react App", played: false },
    { name: "Splendor", origin: "react App", played: false },
  ];

  const boardGames = getInitialBoardGames();

  expect(boardGames).toEqual(expectedBoardGames);
});