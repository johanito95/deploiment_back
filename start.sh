#!/bin/bash

# Installation des dépendances si ce n’est pas déjà fait
composer install --no-dev --optimize-autoloader

# Cache des configurations Laravel
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Lancer le serveur intégré de Laravel sur le port fourni par Railway
php artisan serve --host=0.0.0.0 --port=${PORT:-8080}
