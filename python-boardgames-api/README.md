# Python Boardgames Lists Demo Application

Simple example of a Python/Flask Application providing a list of boardgames with a GET endpoint

# Setup the application localy
- create a virtual env with these commands
> python3 -m venv venv
> source venv/bin/activate

- build the application
> pip install -r requirements.txt


# Run the application

python3 is required.

Run the Application localy with this command and check the url returned
> python3 main.start

Ping the app on http://127.0.0.1:5000/ping

Check the list of boardgames on http://127.0.0.1:5000/boardgames

# How the application works

This application use
- python 3
- flask

# Run the unit tests

Run the unit test with 
> python -m unittest discover tests

