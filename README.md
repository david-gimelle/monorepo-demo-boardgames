# monorepo-demo-gamesboards
Monorepo demo composed of 4 applications in React, Node.js, Python and Java

 The Frontend in [React](./reactjs-boardgames/README.md) displays a list of boardgames, these boardgames are provided by 3 rest api in Python, Node.js and Java.
    - [React Javascript App](./reactjs-boardgames/README.md) 
    - [Node.js Typscript API](./nodejs-boardgames-api/README.md)
    - [Python Flask API](./python-boardgames-api/README.md) 
    - [Java Spring API](./java-boardgames-api/README.md) 

Each application has it own github worklows in the .github/workflows folder in the root of the main folder

# how to run the applications localy
Check the documentation in each application folder to install and start each one. Starting by the React Application, then every api services in any orders. The React application will work even the api services are not running

# how to install and test it all
Use the python 3 script test_all.py at the root of the folder, it will install and test all the services of the monorepo

> python test_all.py


