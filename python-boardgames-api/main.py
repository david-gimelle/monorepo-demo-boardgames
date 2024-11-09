from app import app
from config import Config

if __name__ == '__main__':
    port = getattr(Config, "PORT", 5000)
    app.run(debug=True, port=port)