from app import app
from config import Config
from flask_cors import CORS

# Enable CORS for the entire application
CORS(app, origins=[Config.corsAllowedOrigin])

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001)