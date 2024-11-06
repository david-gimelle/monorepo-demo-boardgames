# React Boardgames Lists Demo Application

Simple example of a React Application managing a list of boardgames provided by different apis in Nodejs, Python and Java

# Install and Run the application react application

npm is required. 
Install the app with
> npm install

Run the Application localy with this command 
> npm run dev

Check the url returned by the previous command, usually something like http://localhost:5173/

# Start the services called by the react application
The application call 3 service-apis as boardgames's datasources: 
- [NodeJS Boardgames API](./nodejsboargames-api/README.md) 
- [Python Boardgames API](./python-boardgames-api/README.md) 
- [Python Boardgames API](./python-boardgames-api/README.md) 

Check the readme of each service to see how to start them.

# How the application connect to the different apis

The main page of the application with build a list of boardgames using 4 datasources:
- The react application itself
- nodejs-boardgames-api
- python-boardgames-api
- java-spring-boardgames-api

The react application displays the original datasource of each boardgames and will display a warning for each service api that it's not able to reach.

# How this react application has been generated

The application has been generate with a vite command
> npm create vite@latest my-react-app --template
