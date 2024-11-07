FROM httpd:latest

# Install Git
RUN apt-get update && apt-get install -y git

RUN git clone https://github.com/mloges-h/newsite.git && cd newsite
# Expose port 80
EXPOSE 80
