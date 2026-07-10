@echo off
setlocal

echo "Création du fichier .gitattributes"

echo * text=auto eol=lf > .gitattributes

echo "Fichier crée"

echo "Modification du fichier .gitignore"

(
echo # Logs
echo logs
echo *.log
echo npm-debug.log*
echo yarn-debug.log*
echo yarn-error.log*
echo pnpm-debug.log*
echo lerna-debug.log*
echo.
echo node_modules
echo dist
echo dist-ssr
echo *.local
echo *.tsbuildinfo
echo .env
echo.
echo # Editor directories and files
echo .vscode/*
echo ^!.vscode/extensions.json
echo .idea
echo .DS_Store
echo *.suo
echo *.ntvs*
echo *.njsproj
echo *.sln
echo *.sw?
) > .gitignore

echo "Fichier crée"