FROM httpd:latest

# Install necessary packages
RUN apt-get update && apt-get install -y git

# Change to the htdocs directory
WORKDIR /usr/local/apache2/htdocs

# Clear the directory and initialize an empty git repository
RUN rm -rf ./* && git init

# Clone your repository into the htdocs directory
RUN git clone https://github.com/mloges-h/newsite.git .

# Optional: Expose the default Apache port
EXPOSE 80
