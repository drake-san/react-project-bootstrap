@echo off
setlocal

echo "Vérification de la présence du dossier src/tests"

if exist "src/tests" (
    echo "Dossier déja existant"
) else (
    call mkdir "src/tests"
    echo "Dossier crée"
)

echo "Création du fichier de test setup.ts"

(
echo import "@testing-library/jest-dom/vitest";
echo import { afterEach } from "vitest";
echo import { cleanup } from "@testing-library/react";
echo.
echo afterEach(cleanup^);
) > src/tests/setup.ts

echo "Fichier crée"