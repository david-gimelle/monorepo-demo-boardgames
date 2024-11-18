// src/App.test.js
import React from 'react';
import { render, screen, act } from '@testing-library/react';
import App from './App';

beforeAll(() => {
  global.fetch = jest.fn((url) => {
    if (url.includes('/java-api/boardgames')) {
      return Promise.resolve({
        json: () => Promise.resolve([]), // Mock an empty array response
      });
    }
    if (url.includes('/python-api/boardgames')) {
      return Promise.resolve({
        json: () => Promise.resolve([]), // Mock an empty array response
      });
    }
    if (url.includes('/node-api/boardgames')) {
      return Promise.resolve({
        json: () => Promise.resolve([]), // Mock an empty array response
      });
    }
    return Promise.reject(new Error('Unknown URL'));
  });
});

afterAll(() => {
  global.fetch.mockClear();
  delete global.fetch;
});

test('renders at least one checkbox', async () => {
  await act(async () => {
    render(<App />);
  });
  const checkboxes = screen.queryAllByRole('checkbox');
  expect(checkboxes.length).toBeGreaterThan(0);
});