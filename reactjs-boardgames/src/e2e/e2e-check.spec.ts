import { test, expect } from '@playwright/test';
import config from '../../config';

test('React App is up and running', async ({ page }) => {
  await page.goto(`http://localhost:${config.reactJSAppPort}/`);
  await expect(page.getByRole('heading', { name: 'Boardgames List' })).toBeVisible();
  await expect(page.getByText('Catan from react App')).toBeVisible();
  await page.locator('li').filter({ hasText: 'Catan from react App' }).getByRole('checkbox').check();
  await expect(page.getByRole('heading', { name: 'Played' })).toBeVisible();
});

test('Java Api is up', async ({ page }) => {
  await page.goto(config.javaApiUrl);
  await expect(page.getByText('[{"name":"Azul","origin":"')).toBeVisible();
});

test('Node Api is up', async ({ page }) => {
  await page.goto(config.nodeApiUrl);
  await expect(page.locator('pre')).toContainText('[{"name":"Ticket to ride","origin":"Node App","played":false},{"name":"Pandemic","origin":"Node App","played":false}]');
});

test('Python Api is up', async ({ page }) => {
  await page.goto(config.pythonApiUrl);
  await expect(page.locator('pre')).toContainText('[ { "name": "Small World", "origin": "Python App", "played": false }, { "name": "Le Havre", "origin": "Python App", "played": false } ]');
});

test('React App is connected to every services', async ({ page }) => {
  await page.goto(`http://localhost:${config.reactJSAppPort}/`);
  await expect(page.getByText('Catan from react App')).toBeVisible();
  await expect(page.getByText('Azul from java App')).toBeVisible();
  await expect(page.getByText('Ticket to ride from Node App')).toBeVisible();
  await expect(page.getByText('Small World from Python App')).toBeVisible();
});