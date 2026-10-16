@echo off
setlocal

echo "Création du fichier typedoc.json..."

(
echo {
echo     "entryPoints": ["src"],
echo     "entryPointStrategy": "expand",
echo     "out": "docs",
echo     "name": "Documentation Kratos Multi Agence",
echo     "exclude": ["**/*.spec.ts", "**/*.test.ts"]
echo }
) > typedoc.json

echo "Fichier crée"