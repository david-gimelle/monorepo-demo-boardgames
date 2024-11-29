// playwright.config.js
import { defineConfig } from '@playwright/test';

const isHeadless = process.env.HEADLESS_TEST !== 'false';

export default defineConfig({
  testDir: './src/e2e',
  timeout: 30000,
  use: {
    headless: isHeadless,
    viewport: { width: 1280, height: 720 },
    ignoreHTTPSErrors: true,
  },
  projects: [
    {
      name: 'chromium',
      use: { browserName: 'chromium' },
    },
  ],
});