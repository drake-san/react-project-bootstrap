@echo off
setlocal

echo "Création du fichier docker-compose.yml"

(
echo services:
echo   your-service:
echo     build: .
echo     container_name: your-container-name
echo     restart: always
echo     ports:
echo       - "1008:80"
echo     volumes:
echo       - .:/app
echo       - ./nginx.conf:/etc/nginx/conf.d/default.conf
) > docker-compose.yml

echo "Fichier crée"

echo "Création du fichier Dockerfile"

(
echo # Étape 1 : Construction de l'application
echo FROM node:lts-alpine AS build
echo.
echo WORKDIR /app
echo COPY package.json package-lock.json lefthook-install.js ./
echo RUN npm install
echo COPY . .
echo RUN npm run build
echo.
echo # Étape 2 : Serveur Nginx pour héberger les fichiers statiques
echo FROM nginx:alpine
echo.
echo COPY --from=build /app/dist /usr/share/nginx/html
echo COPY nginx.conf /etc/nginx/conf.d/default.conf
echo.
echo VOLUME [^"/etc/nginx/conf.d^"]
echo.
echo EXPOSE 80
echo CMD ["nginx", "-g", "daemon off;"]
) > Dockerfile

echo "Fichier crée"