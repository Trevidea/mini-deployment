# Set a Base Model
FROM node:20-alpine AS build

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
RUN npm run build --production

# Serve the app with nginx
FROM nginx:alpine

COPY --from=build /app/dist/sp-coach-app/browser /usr/share/nginx/html
COPY config.template.js /usr/share/nginx/html/
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 4300

# Start Nginx
ENTRYPOINT ["/entrypoint.sh"]