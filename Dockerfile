# Use an official Node.js runtime as a parent image
FROM node:16 AS build

# Set the working directory
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json first for optimized caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your app's code
COPY . .

# Run tests (if this fails, the build stops)
RUN npm test

# Build the app
RUN npm run build

# Final stage
FROM node:16-slim

# Set the working directory
WORKDIR /app

# Copy the built app from the previous stage
COPY --from=build /usr/src/app ./

# Expose the port your app runs on
EXPOSE 3000

# Command to run the app
CMD ["npm", "start"]
