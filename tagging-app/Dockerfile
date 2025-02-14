# Stage 1: Build the Angular application
FROM node:18-alpine AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install --force

# Install Angular CLI globally
RUN npm install -g @angular/cli

# Copy the rest of the application code
COPY . .

# Build the Angular application
RUN npm run build --prod

# Stage 2: Serve the app with nginx
FROM nginx:alpine

# Copy the build output to the Nginx HTML directory
COPY --from=build /app/dist/mob-tagging-app/browser /usr/share/nginx/html

# Copy the Nginx configuration file
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 4600
EXPOSE 4600

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]