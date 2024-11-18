// src/setupTests.js
import '@testing-library/jest-dom';
const fetch = require('node-fetch');

global.fetch = fetch;