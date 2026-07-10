@echo off
setlocal

echo "Modification du fichier vite.config.ts"

(
echo import { defineConfig } from "vite";
echo import react from "@vitejs/plugin-react";
echo import tailwindcss from "@tailwindcss/vite";
echo import path from "node:path";
echo import compression from "vite-plugin-compression2";
echo.
echo // https://vite.dev/config/
echo export default defineConfig({
echo     plugins: [react(^), tailwindcss(^), compression(^)],
echo     resolve: {
echo         alias: {
echo             "@": path.resolve(__dirname, "./src"^),
echo         },
echo     }
echo }^);
) > vite.config.ts

echo "Fichier modifié"