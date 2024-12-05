# Python Boardgames Lists Demo Application

Simple example of a Python/Flask/Poetry Api Application providing a list of boardgames with a GET endpoint

# Requirements for this app
- Python 3
- Poetry 1.1.11
- Flask

# Setup the application localy

- Install Poetry
> pip install poetry==1.1.11

- build the application project and its dependencies
> poetry install

# Install and build an image of the project
use the script below. This script will ensure poetry 1.1.11 is used to install the project and build an the image
> python install-build.py

you can skip the tests with --skip-tests
> python install-build.py --skip-tests

you can skip the installation of the project and dependency with --skip-install-poetry
> python install-build.py --skip-install-poetry

you can skip build the image with --skip-poetry
> python install-build.py --skip-build-image

# Run the application

python3 and poetry are required.

Run the Application localy with this command and check the url returned
> poetry run python main.py

Ping the app on http://127.0.0.1:5001/ping

Check the list of boardgames on http://127.0.0.1:5001/boardgames

# Run the unit tests

Run the unit tests with 
> poetry run pytest

# How to change port and url of the react application for cors authorisation

This is configurable from the file config.py

# Images

you can build one localy with this command
> docker build -t python-boardgames-api .
> docker build --no-cache --progress=plain -t python-boardgames-api .

You build an image with this script
> python install-build.py
> python install-build.py --skip-install-poetry --skip-tests


