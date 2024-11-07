FROM httpd:latest

# Install Git
RUN apt-get update && apt-get install -y git

# Clone the Git repository
RUN git clone https://github.com/mloges-h/newsite.git /usr/local/apache2/htdocs/

# Expose port 80
EXPOSE 80
