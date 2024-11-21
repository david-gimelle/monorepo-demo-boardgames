from app import app
from config import Config
from flask_cors import CORS

# Enable CORS for the entire application
CORS(app, origins=[Config.corsAllowedOrigin])

if __name__ == '__main__':
    port = getattr(Config, "PORT", 5000)
    app.run(debug=True, port=port)