FROM httpd:latest

# Install Git
RUN apt-get update && apt-get install -y git

# Clone the GitHub repository (Replace with your GitHub repository URL)
RUN git clone https://github.com/yourusername/your-repo.git /usr/local/apache2/htdocs/

# Expose port 80
EXPOSE 80
