// src/App.test.js
import React from 'react';
import { render, screen } from '@testing-library/react';
import App from './App';

test('renders Vite and React logos', () => {
  render(<App />);
  const viteLogo = screen.getByAltText('Vite logo');
  const reactLogo = screen.getByAltText('React logo');
  expect(viteLogo).toBeInTheDocument();
  expect(reactLogo).toBeInTheDocument();
});

test('renders the count button', () => {
  render(<App />);
  const button = screen.getByRole('button', { name: /count is/i });
  expect(button).toBeInTheDocument();
});