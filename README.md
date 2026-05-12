# site
sudo mkdir /var/www/html/solaura

# Copie du fichier index.html dans /var/www/html/solaura
sudo cp site/index.html /var/www/html/solaura 
sudo nano /etc/nginx/sites-available/solaura
#Ajouter la configuration suivant
server {
    listen 80;
    server_name localhost;

    root /var/www/html/solaura;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    # Pour les fichiers statiques
    location ~* \.(html|css|js|jpg|jpeg|png|gif|ico|svg)$ {
        expires 7d;
        add_header Cache-Control "public, immutable";
    }
}

# Créer un lien symbolique         
sudo ln -s /etc/nginx/sites-available/solaura /etc/nginx/sites-enabled/

# Vérifier la configuration
sudo nginx -t

# Redémarrer Nginx
sudo systemctl restart nginx
