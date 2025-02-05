# React Boardgames Lists Demo Application
Simple example of a React Application managing a list of boardgames provided by different apis in Nodejs, Python and Java. It displays detailed error message for each api it's not able to reach.

# Install and Run the application react application
npm is required. 
Install the app with
> npm install

Test the application with
> npm test

Run the Application localy with this command 
> npm run dev

Check the url returned by the previous command, usually something like http://localhost:5173/

# Start the services called by the react application
The application call 3 service-apis as boardgames's datasources: 
- [NodeJS Boardgames API](./nodejsboargames-api/README.md) 
- [Python Boardgames API](./python-boardgames-api/README.md) 
- [Java Boardgames API](./java-boardgames-api/README.md) 

Check the readme of each service to see how to start them.

# How to run the end 2 end tests localy
Run the command below to run the end 2 end test with playwright. It will tests the react application and some tests will fails if not all the service api are up and running. 
> npm run e2e
To See the chromium browser during the test run this command
> HEADLESS_TEST=false npm run test:e2e

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

# How to change ports and urls of services
This is configurable from the file config.js. But this will break cors setting and the port must also be changed in every api service for the field cors:allowed-origins

# How to build and run the docker image
The docker image is build with the command
> docker build -t react-boardgames .

The docker image can be run with the command
> docker run -d -p 5175:5175 --name react-app react-boardgames