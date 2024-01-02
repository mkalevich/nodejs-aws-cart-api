# Stage 1
FROM node:18-alpine AS builder

WORKDIR /usr/src/app

# Copy and install dependencies.
COPY package*.json .
RUN npm install

# Copy the rest files.
COPY . .

# Build the application.
RUN npm run build

# Stage 2
FROM node:18-alpine

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/dist .

USER node

EXPOSE 4000

CMD [ "node", "main.js" ]