import unittest
from app import app

class RoutesTestCase(unittest.TestCase):
    def setUp(self):
        self.app = app.test_client()
        self.app.testing = True

    def test_ping(self):
        response = self.app.get('/ping')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json, {"message": "pong"})

    def test_get_boardgames(self):
        response = self.app.get('/boardgames')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json, [
            { "name": "Small World", "origin": "Python App", "played": False },
            { "name": "Le Havre", "origin": "Python App", "played": False }
        ])

if __name__ == '__main__':
    unittest.main()