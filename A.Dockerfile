# syntax=docker/dockerfile:1

# specify node base image
FROM node:16

# specify working dir
WORKDIR /app

# copy package.json and package-lock.json
COPY ["package.json", "package-lock.json*", "./"]

# run npm install to install all dependencies
RUN npm install

# copy the source code to the image
COPY . .

# expose a port 
EXPOSE 8000

# give command to start the app
CMD [ "node", "server.js" ]