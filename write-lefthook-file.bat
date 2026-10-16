@echo off
setlocal

echo "Création du fichier lefthook.yml"

(
echo pre-commit:
echo     parallel: true
echo     commands:
echo         lint:
echo             glob: "*.{ts,tsx,js,jsx}"
echo             run: npx eslint {staged_files}
echo.
echo         format:
echo             glob: "*.{ts,tsx,js,jsx,json,md}"
echo             run: npx prettier --write {staged_files}
echo.
echo         typecheck:
echo             run: npm run typecheck
echo.
echo commit-msg:
echo     commands:
echo         commitlint:
echo             run: npx commitlint --edit $1
echo.
echo pre-push:
echo     parallel: true
echo     commands:
echo         lint:
echo             run: npm run lint
echo.
echo         typecheck:
echo             run: npm run typecheck
echo.
echo         test:
echo             run: npm run test:run
echo.
echo         build:
echo             run: npm run build
echo.
echo post-merge:
echo     parallel: true
echo     jobs:
echo         - name: "Generate documentation"
echo           run: npm run doc
echo         - name: "Install dependencies"
echo           run: npm install
echo.
echo post-checkout:
echo     parallel: true
echo     jobs:
echo         - name: "Generate documentation"
echo           run: npm run doc
echo         - name: "Install dependencies"
echo           run: npm install
) > lefthook.yml

echo "Fichier crée"

echo "Création du fichier lefthook-install.js"

(
    echo import fs from "node:fs";
    echo import { execSync } from "node:child_process";
    echo import process from "node:process";
    echo.
    echo if (process.env.CI^) process.exit(0^);
    echo.
    echo if (fs.existsSync(".git"^)^)
    echo {
    echo    console.log("Git directory found, installing lefthook"^);
    echo.
    echo    try
    echo    {
    echo      execSync("npx lefthook install", { stdio: "inherit" }^);
    echo    } catch(exception^)
    echo      {
    echo        console.error("Failed to install lefthook", exception^);
    echo      }
    echo }
) > lefthook-install.js

echo "Fichier crée"