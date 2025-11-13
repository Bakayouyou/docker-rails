#!/bin/bash
set -e

# Si pas de Gemfile, créer une nouvelle app Rails
if [ ! -f "$APP_HOME/Gemfile" ]; then
  echo "🚀 Aucun projet détecté, création d'une app Rails API..."
  rails new . --api --database=postgresql --force
  echo "✅ Application Rails API créée !"
fi

# Installer les gems
bundle install

# Préparer la base de données
bundle exec rails db:prepare

# Démarrer le serveur Rails
echo "🚀 Démarrage du serveur Rails..."
exec bundle exec rails s -b 0.0.0.0 -p 3000
