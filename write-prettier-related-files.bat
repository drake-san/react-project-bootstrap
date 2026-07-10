@echo off
setlocal

echo "Création du fichier .prettierignore"

(
echo dist
echo build
echo node_modules
echo.
echo coverage
echo.
echo *.lock
echo.
echo package-lock.json
echo pnpm-lock.yaml
echo yarn.lock
) > .prettierignore

echo "Fichier crée"

echo "Création du fichier .prettierrc"

(
echo {
echo     "semi": true,
echo     "singleQuote": false,
echo     "jsxSingleQuote": false,
echo     "trailingComma": "all",
echo     "printWidth": 100,
echo     "tabWidth": 4,
echo     "useTabs": true,
echo     "arrowParens": "always",
echo     "bracketSpacing": true,
echo     "bracketSameLine": false,
echo     "endOfLine": "lf"
echo }
) > .prettierrc

echo "Fichier crée"