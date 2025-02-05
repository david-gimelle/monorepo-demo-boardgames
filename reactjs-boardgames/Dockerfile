FROM node:21-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

EXPOSE 5173

# Add --host to allow external connections
CMD ["npm", "run", "preview", "--", "--host", "0.0.0.0", "--port", "5173"]