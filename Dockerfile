# Dockerfile

# base image based on minimal alpine linux: https://nickjanetakis.com/blog/the-3-biggest-wins-when-using-alpine-as-a-base-docker-image
# contains npm / yarn pkg managers
FROM node:alpine

# create & set working directory
RUN mkdir -p /app
WORKDIR /app

# Copy package.json and package-lock.json
# to the /app working directory
COPY package*.json /app

# install dependencies
RUN npm install

# copy source files
COPY . /app

# build app
RUN npm run build

# Ensure port 3000 is accessible to our system
EXPOSE 3000
# start app
CMD npm run dev
