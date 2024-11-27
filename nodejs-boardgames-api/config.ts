const config = {
    port: parseInt(process.env.PORT || '3000', 10),
    corsAllowedOrigin: process.env.CORS_ALLOWED_ORIGIN || 'http://localhost:5175',
  };
  
  export default config;