FROM php:8.1-apache



# Set working directory
WORKDIR /var/www/html

# Install dependencies


# RUN apt-get update && apt-get install -y \
#     libpng-dev \
#     libonig-dev \
#     libxml2-dev \
#     zip \
#     unzip \
#     libapache2-mod-php8.1
# RUN docker-php-ext-install pdo_mysql

# Enable Apache modules
RUN a2enmod rewrite

RUN apt-get update && apt-get install -y \
    libonig-dev \
    zlib1g-dev \
    libzip-dev \
    zip \
    unzip
# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath zip

# Copy Apache site configuration
COPY apache/apache.conf /etc/apache2/sites-available/000-default.conf

# Enable Apache site configuration
RUN a2ensite 000-default.conf

# Copy the composer.json and composer.lock files
COPY src/composer.json src/composer.lock ./

# Install project dependencies
# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ENV COMPOSER_ALLOW_SUPERUSER=1

RUN composer install --no-scripts 

# Copy the rest of the application files
COPY src/ .

# Generate key
# RUN php artisan key:generate

# Set permissions
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# Expose port 80
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
