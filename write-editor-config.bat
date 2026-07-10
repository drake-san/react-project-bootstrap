@echo off
setlocal

echo "Création du fichier .editorconfig"

(
echo root = true
echo.
echo [*]
echo charset = utf-8
echo end_of_line = lf
echo insert_final_newline = true
echo trim_trailing_whitespace = true
echo.
echo indent_style = space
echo indent_size = 2
echo.
echo [*.md]
echo trim_trailing_whitespace = false
echo.
echo [*.{json,yml,yaml}]
echo indent_size = 2
) > .editorconfig

echo "Fichier crée"