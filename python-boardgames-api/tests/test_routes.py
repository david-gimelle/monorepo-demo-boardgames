import pytest
from app import app

@pytest.fixture
def client():
    with app.test_client() as client:
        app.testing = True
        yield client

def test_ping(client):
    response = client.get('/ping')
    assert response.status_code == 200
    assert response.json == {"message": "pong"}

def test_get_boardgames(client):
    response = client.get('/boardgames')
    assert response.status_code == 200
    assert response.json == [
        { "name": "Small World", "origin": "Python App", "played": False },
        { "name": "Le Havre", "origin": "Python App", "played": False }
    ]