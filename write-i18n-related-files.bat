@echo off
setlocal

echo "Vérification de la présence du dossier src/i18n"

if exist "src/i18n" (
    echo "Dossier trouvé"
) else (
    echo "Création du dossier src/i18n"
    call mkdir "src/i18n"
    echo "Dossier crée"
)

echo "Création du fichier i18n.ts"

(
echo import i18n from "i18next";
echo import { initReactI18next } from "react-i18next";
echo import en from "./locales/en.json";
echo import fr from "./locales/fr.json";
echo.
echo const defaultLanguage = localStorage.getItem("lang"^) ^|^| navigator.language.split^("-"^)[0^];
echo.
echo void i18n.use(initReactI18next^).init({
echo     resources: {
echo         en: {
echo             translation: en,
echo         },
echo         fr: {
echo             translation: fr,
echo         },
echo     },
echo     lng: defaultLanguage,
echo     fallbackLng: "en",
echo     interpolation: {
echo         escapeValue: false,
echo     },
echo }^);
echo.
echo export default i18n;
) > src/i18n/i18n.ts

echo "Fichier crée"

echo "Création du fichier i18n (pour les tests uniquements)"

(
echo import i18n from "i18next";
echo import { initReactI18next } from "react-i18next";
echo import en from "./locales/en.json";
echo import fr from "./locales/fr.json";
echo.
echo void i18n.use(initReactI18next^).init({
echo     lng: "en",
echo     fallbackLng: "en",
echo     debug: false,
echo     resources: {
echo         en: {
echo             translation: en,
echo         },
echo         fr: {
echo             translation: fr,
echo         },
echo     },
echo     interpolation: {
echo         escapeValue: false,
echo     },
echo }^);
echo.
echo export default i18n;
) > src/i18n/i18nForTests.ts

echo "Fichier crée"

echo "Création des fichiers de traductions (anglais et francais)"

echo "Création du dossier locales"

if exist "src/i18n/locales" (
    echo "Dossier déja existant"
) else (
    call mkdir "src/i18n/locales"
    echo "Dossier crée"
)

echo {} > src/i18n/locales/en.json
echo {} > src/i18n/locales/fr.json

echo "Fichier crée"