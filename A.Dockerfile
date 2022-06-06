# syntax=docker/dockerfile:1.2

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

# accessing the secret can be used here to make some changes to the docker image
RUN --mount=type=secret,id=A_secret cat /run/secrets/A_secret

# expose a port 
EXPOSE 8000

# give command to start the app
CMD [ "node", "server.js" ]