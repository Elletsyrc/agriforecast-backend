# Base image with PHP and Apache
FROM php:8.2-apache

# Install Python and venv
RUN apt-get update && apt-get install -y python3 python3-pip python3-venv

# Copy PHP files
COPY api/ /var/www/html/api/
COPY config.php /var/www/html/
COPY hash.php /var/www/html/

# Copy Python microservice
COPY microservice/ /app/microservice/
WORKDIR /app/microservice

# Create virtual environment and install dependencies
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Expose port
EXPOSE 10000

# Start PHP server
CMD php -S 0.0.0.0:10000 -t /var/www/html
