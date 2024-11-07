FROM httpd:latest

# Install Git
RUN apt-get update && apt-get install -y git

# Set the working directory to Apache's htdocs
WORKDIR /usr/local/apache2/htdocs

# Clean the htdocs directory
RUN rm -rf /usr/local/apache2/htdocs/*

# Clone the Git repository into the htdocs directory
RUN git clone https://github.com/mloges-h/newsite.git .

# Expose port 80 for Apache
EXPOSE 80

