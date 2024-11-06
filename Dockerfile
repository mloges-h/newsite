# Use the official Apache HTTP Server image
FROM httpd:latest  # or your base image
RUN apt-get update && apt-get install -y curl

# Copy your HTML file into the Apache server's root directory
COPY . /usr/local/apache2/htdocs/

# Expose port 80
EXPOSE 80
