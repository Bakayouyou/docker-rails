FROM ruby:3.2.2-slim

ENV RAILS_ENV=development \
    BUNDLE_PATH=/usr/local/bundle \
    LANG=C.UTF-8 \
    TZ=Europe/Paris \
    APP_HOME=/app

# Dépendances système
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
      build-essential \
      libpq-dev \
      nodejs \
      git \
      curl \
      pkg-config \
      gnupg \
      ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR $APP_HOME

# Installer Rails
RUN gem install rails

# Entrypoint automatisé
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
