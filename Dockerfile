# Base image with PHP and Apache
FROM php:8.2-apache

# Install Python and pip
RUN apt-get update && apt-get install -y python3 python3-pip

# Copy PHP files
COPY api/ /var/www/html/api/
COPY config.php /var/www/html/
COPY hash.php /var/www/html/

# Copy Python microservice
COPY microservice/ /app/microservice/
WORKDIR /app/microservice

# Upgrade pip and install dependencies
RUN python3 -m pip install --upgrade pip --break-system-packages
RUN python3 -m pip install -r requirements.txt --break-system-packages

# Expose port
EXPOSE 10000

# Start PHP server
CMD php -S 0.0.0.0:10000 -t /var/www/html
