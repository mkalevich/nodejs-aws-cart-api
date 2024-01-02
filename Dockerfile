# Base image
FROM node:18-alpine

# Create app directory
WORKDIR /usr/src/app

# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy files
COPY . .

# Creates a "dist" folder with the build
RUN npm run build

# Expose the port
EXPOSE 4000

# Start the server using the build
CMD ["npm", "run", "start:prod"]