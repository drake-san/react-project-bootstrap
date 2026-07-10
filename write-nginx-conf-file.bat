@echo off
setlocal

echo "Création du fichier nginx.conf"

(
echo server {
echo     listen 80;
echo     server_name your-server-name;
echo.
echo     location / {
echo         root /usr/share/nginx/html;
echo         index index.html;
echo         try_files %%uri /index.html;
echo     }
echo }
) > nginx.conf

echo "Fichier crée"