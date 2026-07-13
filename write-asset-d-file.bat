@echo off
setlocal

echo "Vérification de la présence du dossier src/types"

if exist "src/types" (
    echo "Dossier trouvé"
) else (
    echo "Création du dossier src/types"
    call mkdir "src/types"
    echo "Dossier crée"
)

echo "Création du fichier assets.d.ts"

(
echo type ImageModule = string;
echo.
echo declare module "*.png" ^{
echo     const src: ImageModule;
echo     export default src;
echo ^}
echo.
echo declare module "*.jpg" ^{
echo     const src: ImageModule;
echo     export default src;
echo ^}
echo.
echo declare module "*.jpeg" ^{
echo     const src: ImageModule;
echo     export default src;
echo ^}
echo.
echo declare module "*.svg" ^{
echo     const src: ImageModule;
echo     export default src;
echo ^}
echo.
echo declare module "*.gif" ^{
echo     const src: ImageModule;
echo     export default src;
echo ^}
) > src/types/assets.d.ts

echo "Fichier crée"