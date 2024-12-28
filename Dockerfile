FROM httpd:latest

# Install necessary packages
RUN apt-get update && apt-get install -y git

# Change to the htdocs directory
WORKDIR /usr/local/apache2/htdocs

# Comprehensive cleanup of the directory
RUN rm -rf ./* .[^.] .??* || true

# Clone your repository into the htdocs directory
RUN git clone https://github.com/mloges-h/newsite.git .

# Optional: Expose the default Apache port
EXPOSE 80
