# Use the official Apache HTTP Server image
FROM httpd:latest

# Copy your HTML file into the Apache server's root directory
COPY . /usr/local/apache2/htdocs/

# Expose port 80
EXPOSE 80
