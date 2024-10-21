# Use the official Node.js image as the base image
FROM node:16

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install the project dependencies
RUN npm install

# Install TypeScript globally (if needed)
RUN npm install -g typescript

# Copy the rest of the application files
COPY . .

# Build the TypeScript application (ensure tsc command has the right permissions)
RUN chmod +x ./node_modules/.bin/tsc && npm run build

# Expose the port the app will run on
EXPOSE 3000

# Command to run the application
CMD [ "npm", "start" ]
