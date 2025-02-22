# NodeJs Boardgames Lists Demo Application

Simple example of a nodeJS/Express Application in typescript providing a list of boardgames with a GET endpoint

# Run the application

npm is required.

Install the application with
> npm install

Run the Application localy with this command and check the url returned
> npm start

Ping the app on http://localhost:3000/ping

Check the list of boardgames on http://localhost:3000/boardgames

# How the application works

This application use
- nodejs
- typescript
- express for the Rest API
- jest for the unit tests

# Run the unit tests

Run the unit test with 
> npm test

# How to change port and url of the react application for cors authorisation

This is configurable from the file config.ts

# Images

you can build one localy with this command
> docker build -t nodejs-boardgames-api .
> docker build --no-cache --progress=plain -t nodejs-boardgames-api .

Run it with
> docker run -p 3000:3000 nodejs-boardgames-api
