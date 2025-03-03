FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the Vite app
RUN npm run build

# Expose port 5173 (default for Vite)
EXPOSE 5173

# Start the Vite development server
CMD ["npm", "run", "preview"]
