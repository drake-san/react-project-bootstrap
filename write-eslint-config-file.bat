@echo off
setlocal

echo "Création du fichier eslint.config.js"

(
echo import js from "@eslint/js";
echo import globals from "globals";
echo import reactHooks from "eslint-plugin-react-hooks";
echo import unusedImports from "eslint-plugin-unused-imports";
echo import tseslint from "typescript-eslint";
echo import prettier from "eslint-config-prettier";
echo.
echo export default tseslint.config(
echo   {
echo     ignores: [
echo       "dist",
echo       "build",
echo       "node_modules",
echo       "*.config.js",
echo       "*.config.cjs",
echo       "*.config.mjs",
echo       "vite.config.ts",
echo       "globals.d.ts",
echo       "lefthook-install.js",
echo     ],
echo   },
echo.
echo   js.configs.recommended,
echo.
echo   ...tseslint.configs.recommendedTypeChecked,
echo.
echo   {
echo     files: ["src/**/*.{ts,tsx}"],
echo.
echo     languageOptions: {
echo       parserOptions: {
echo         projectService: true,
echo         tsconfigRootDir: import.meta.dirname,
echo         ecmaFeatures: {
echo           jsx: true,
echo         },
echo       },
echo.
echo       globals: {
echo         ...globals.browser,
echo         ...globals.es2024,
echo       },
echo     },
echo.
echo     plugins: {
echo       "react-hooks": reactHooks,
echo       "unused-imports": unusedImports,
echo     },
echo.
echo     rules: {
echo       // Hooks
echo       ...reactHooks.configs.recommended.rules,
echo.
echo       // Unused imports
echo       "unused-imports/no-unused-imports": "error",
echo.
echo       "unused-imports/no-unused-vars": [
echo         "warn",
echo         {
echo           vars: "all",
echo           varsIgnorePattern: "^_",
echo           args: "after-used",
echo           argsIgnorePattern: "^_",
echo         },
echo       ],
echo.
echo       // TS
echo       "@typescript-eslint/no-explicit-any": "warn",
echo.
echo       "@typescript-eslint/consistent-type-imports": [
echo         "error",
echo         {
echo           prefer: "type-imports",
echo         },
echo       ],
echo     },
echo   },
echo.
echo   prettier
echo ^);
) > eslint.config.js

echo "Fichier crée"