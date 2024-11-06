from app import app
from flask import jsonify

def get_boardgames_list():
    return [
        { "name": "Small World", "origin": "Python App", "played": False },
        { "name": "Le Havre", "origin": "Python App", "played": False }
    ]

@app.route('/ping', methods=['GET'])
def pinging():
    return jsonify({"message": "pong"}), 200

@app.route('/boardgames', methods=['GET'])
def get_boardgames():
    boardgames = get_boardgames_list()
    return jsonify(boardgames), 200