FROM httpd:latest

# Install Git
RUN apt-get update && apt-get install -y git

# Clone the GitHub repository (Replace with your GitHub repository URL)
COPY . /mnt

# Expose port 80
EXPOSE 80
