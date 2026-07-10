@echo off
setlocal

echo "Création du fichier commitlint.config.cjs..."

echo module.exports = {extends: ["@commitlint/config-conventional"],}; > commitlint.config.cjs

echo "Fichier crée"