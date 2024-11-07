FROM httpd:latest

# Install Git
RUN apt-get update && apt-get install -y git

# Clone the Git repository


# Expose port 80
EXPOSE 80
