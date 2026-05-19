FROM php:8.2-apache 
COPY api/ /var/www/html/api/ 
COPY config.php /var/www/html/ 
COPY hash.php /var/www/html/ 
COPY microservice/ /app/microservice/ 
WORKDIR /app/microservice 
RUN pip3 install -r requirements.txt 
EXPOSE 10000 
CMD php -S 0.0.0.0:10000 -t /var/www/html & 
