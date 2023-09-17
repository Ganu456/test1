# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy your application code and the JSON file to the working directory
COPY . .

# Define environment variables (e.g., MongoDB connection string)
ENV MONGODB_URI=your_mongodb_connection_string

# Expose the port your application will run on (if applicable)
EXPOSE 3000

# Command to run your application
CMD ["node", "app.js"]
