FROM php:8.2-cli

RUN apt-get update && apt-get install -y \
    git unzip libpng-dev libonig-dev libxml2-dev zip curl \
 && docker-php-ext-install pdo_mysql mbstring bcmath gd \
 && rm -rf /var/lib/apt/lists/*

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www
COPY composer.json composer.lock* ./

# تثبيت الحِزم بدون سكربتات لتقليل الاستهلاك
RUN composer install --no-dev --no-scripts --prefer-dist --no-interaction

COPY . .

EXPOSE 10000
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=10000"]
