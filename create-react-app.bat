@echo off
setlocal

if "%1"=="" (
    echo Usage: %0 nom_du_projet
    exit /b 1
)

echo Création du projet React...
call npm create vite@latest %1 -- --template react-ts --no-interactive --no-install

cd /d %1 || (
    echo "Erreur: impossible de changer de dossier"
    exit /b 1
)

echo Initialisation de git
call git init

echo Installation des dépendances principales...
call npm i react-router tailwindcss @tailwindcss/vite react-hook-form lucide-react axios gsap @gsap/react react-i18next i18next react-svg

echo Installation des plugins dev...
call npm i unplugin-imagemin vite-plugin-compression2 --save-dev

echo Installation des plugins lint...
call npm install -D eslint @eslint/js typescript-eslint eslint-plugin-react-hooks eslint-plugin-react-refresh eslint-plugin-unused-imports eslint-config-prettier globals prettier

echo Installation des plugins de tests...
call npm install -D  @types/jest vitest @testing-library/react @testing-library/user-event @testing-library/jest-dom jsdom msw

echo Installation Lefthook...
call npm install -D lefthook
call npx lefthook install

echo Installation Commitlint...
call npm install -D @commitlint/cli @commitlint/config-conventional

echo Initialisation de eslint...
call npx eslint --init

echo Création des fichiers

call "%~dp0write-commitlint-config-file.bat"
call "%~dp0write-docker-related-files.bat"
call "%~dp0write-editor-config.bat"
call "%~dp0write-eslint-config-file.bat"
call "%~dp0write-git-related-files.bat"
call "%~dp0write-globals-d-ts-file.bat"
call "%~dp0write-i18n-related-files.bat"
call "%~dp0write-lefthook-file.bat"
call "%~dp0write-nginx-conf-file.bat"
call "%~dp0write-prettier-related-files.bat"
call "%~dp0write-setup-test-file.bat"
call "%~dp0write-tsconfig-files.bat"
call "%~dp0write-vite-config-file.bat"
call "%~dp0write-asset-d-file.bat"

(
    echo Le projet a été généré avec succès. Veuillez ajouter ces éléments au bloc scripts de votre fichier package.json
    echo "prepare": "node lefthook-install.js",
    echo "lint": "eslint .",
    echo "lint:fix": "eslint . --fix",
    echo "format": "prettier . --write",
    echo "format:check": "prettier . --check",
    echo "typecheck": "tsc --noEmit",
    echo "test": "vitest",
    echo "test:run": "vitest run"
) > %temp%/create-react-app-ok.txt

call notepad %temp%/create-react-app-ok.txt

echo Lancement du projet
call npm run dev
