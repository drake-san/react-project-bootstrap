@echo off
setlocal

echo "Modification des fichiers tsconfig"

(
echo {
echo   "compilerOptions": {
echo     "types": [
echo       "jest",
echo       "node"
echo     ]
echo   },
echo   "files": [],
echo   "references": [
echo     {
echo       "path": "./tsconfig.app.json"
echo     },
echo     {
echo       "path": "./tsconfig.node.json"
echo     }
echo   ]
echo }
) > tsconfig.json

(
echo {
echo   "compilerOptions": {
echo     "target": "ES2022",
echo     "lib": [
echo       "ES2022",
echo       "DOM",
echo       "DOM.Iterable"
echo     ],
echo     "types": [
echo       "vite/client"
echo     ],
echo     "module": "ESNext",
echo     "moduleResolution": "Bundler",
echo     "jsx": "react-jsx",
echo     "strict": true,
echo     "noFallthroughCasesInSwitch": true,
echo     "noUncheckedIndexedAccess": true,
echo     "noImplicitOverride": true,
echo     "noEmit": true,
echo     "allowImportingTsExtensions": false,
echo     "resolveJsonModule": true,
echo     "isolatedModules": true,
echo     "skipLibCheck": true,
echo     "paths": {
echo       "@/*": [
echo         "./src/*"
echo       ]
echo     }
echo   },
echo   "include": [
echo     "src"
echo   ]
echo }
) > tsconfig.app.json

(
echo {
echo   "compilerOptions": {
echo     "target": "ES2022",
echo     "lib": [
echo       "ES2023"
echo     ],
echo     "module": "ESNext",
echo     "moduleResolution": "Bundler",
echo     "strict": true,
echo     "noEmit": true,
echo     "skipLibCheck": true,
echo     "allowSyntheticDefaultImports": true,
echo     "types": [
echo       "node"
echo     ]
echo   },
echo   "include": [
echo     "vite.config.ts"
echo   ]
echo }
) > tsconfig.node.json

echo "Modification terminée"