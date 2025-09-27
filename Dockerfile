FROM python:3.13-slim

# Dépendances système minimales pour Node.js et pip
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    gnupg \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y --no-install-recommends nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Répertoire de travail
WORKDIR /app

# Copie des fichiers nécessaires
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Commande de démarrage
CMD ["myst", "start"]
