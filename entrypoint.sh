#!/bin/bash

# Ensure script stops on error
set -e

if [ ! -d "vendor" ]; then
  composer install
fi

# Install npm deps if missing
if [ ! -d "node_modules" ]; then
  npm install
fi

# Generate app key if missing
if [ ! -f ".env" ]; then
  cp .env.example .env
fi

# First time setup (key generate & migration)
if [ ! -f /var/www/html/.docker-setup-done ]; then
    echo "Running initial setup..."
    php artisan key:generate

    # Wait for MySQL to be ready
    until php artisan migrate --seed; do
      echo "Waiting for MySQL to be ready..."
      sleep 5
    done

    touch /var/www/html/.docker-setup-done
else
    echo "Initial setup already done. Skipping..."
fi

#group permission for sajo and www-data users
groupadd laravel
usermod -a -G laravel www-data
chown -R www-data:laravel /var/www/html/storage /var/www/html/bootstrap/cache
chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache
find /var/www/html/storage /var/www/html/bootstrap/cache -type d -exec chmod g+s {} \;


# Run Vite in background
npm run dev > /var/log/vite.log 2>&1 &

# Wait for Vite
echo "Waiting for Vite to be ready..."
while ! curl -s http://localhost:5173 > /dev/null; do
  sleep 2
done
echo "Vite is ready!"

# Start Apache
exec apache2-foreground
