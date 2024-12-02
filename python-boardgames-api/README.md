# Python Boardgames Lists Demo Application

Simple example of a Python/Flask/Poetry Api Application providing a list of boardgames with a GET endpoint

# Setup the application localy
- Install Poetry
> pip install poetry

- build the application project and its dependencies
> poetry install

# Run the application

python3 and poetry are required.

Run the Application localy with this command and check the url returned
> poetry run python main.py

Ping the app on http://127.0.0.1:5001/ping

Check the list of boardgames on http://127.0.0.1:5001/boardgames

# How the application works

This application uses
- python 3
- flask

# Run the unit tests

Run the unit tests with 
> poetry run pytest

# How to change port and url of the react application for cors authorisation

This is configurable from the file config.py


