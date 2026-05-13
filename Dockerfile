# Image de base légère avec Nginx
FROM nginx:alpine

# Supprimer la config Nginx par défaut
RUN rm /etc/nginx/conf.d/default.conf

# Copier notre configuration Nginx personnalisée
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copier tous les fichiers du site dans le dossier web
COPY index.html /usr/share/nginx/html/

# Exposer le port 80
EXPOSE 80

# Nginx se lance automatiquement avec CMD par défaut
