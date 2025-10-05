#!/bin/bash

echo "🚀 Starting Laravel on Railway..."

# Installer les dépendances PHP
composer install --no-dev --optimize-autoloader

# Générer la clé d'application si elle n'existe pas
if [ -z "$APP_KEY" ]; then
  echo "⚙️ Generating Laravel APP_KEY..."
  php artisan key:generate
fi

# Mettre en cache les fichiers de config
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Lancer le serveur Laravel sur le port fourni par Railway
php artisan serve --host=0.0.0.0 --port=${PORT:-8080}
