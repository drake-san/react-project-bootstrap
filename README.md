# React Project Bootstrap ⚛

Un script Windows permettant de créer rapidement un projet **React + TypeScript** avec une configuration prête pour le développement professionnel.

En une seule commande, le script génère un projet Vite, installe les dépendances essentielles, configure les outils de qualité de code, initialise Git et crée plusieurs fichiers de configuration.

> **⚠️ Compatibilité**
>
> Ce projet est conçu **uniquement pour Windows**. Il repose sur des scripts Batch (`.bat`) et utilise des commandes propres à l'environnement Windows (`cmd`).
>
> Il ne fonctionnera pas sous Linux ou macOS sans adaptation.


## Fonctionnalités

Le script effectue automatiquement les étapes suivantes :

* Création d'un projet **React + TypeScript** avec Vite
* Initialisation d'un dépôt Git
* Installation des dépendances principales :

  * React Router
  * Tailwind CSS
  * React Hook Form
  * Axios
  * GSAP
  * React i18next
  * Lucide React
  * React SVG
* Installation des outils de développement

  * Compression Vite
  * Optimisation des images
* Configuration de :

  * ESLint
  * Prettier
  * Commitlint
  * Lefthook
* Installation des outils de test

  * Vitest
  * Testing Library
  * Jest DOM
  * MSW
  * JSDOM
* Génération automatique de plusieurs fichiers de configuration :

  * Docker
  * Nginx
  * TypeScript
  * Vite
  * ESLint
  * Prettier
  * Git
  * i18n
  * Tests
  * EditorConfig
  * etc.
* Ouverture d'un mémo contenant les scripts à ajouter au `package.json`
* Lancement automatique du serveur de développement

---

## Prérequis

Les outils suivants doivent être installés sur votre machine :

* Node.js
* npm
* Git

---

## Utilisation

```bash
create-react-app.bat nom_du_projet
```

Exemple :

```bash
create-react-app.bat mon-super-projet
```

Le script créera un dossier `mon-super-projet`, installera toutes les dépendances, configurera le projet puis lancera automatiquement Vite.

---

## Configuration d'ESLint

Lors de l'exécution du script, la commande `npx eslint --init` lance un assistant interactif. Répondez aux différentes questions comme indiqué ci-dessous :

```text
✔ What do you want to lint?                          → JavaScript
✔ How would you like to use ESLint?                  → To check syntax and find problems
✔ What type of modules does your project use?        → JavaScript modules (import/export)
✔ Which framework does your project use?             → React
✔ Does your project use TypeScript?                  → Yes
✔ Where does your code run?                          → Browser
✔ Which language do you want your configuration file be written in? → JavaScript

The config that you've selected requires the following dependencies:
eslint, @eslint/js, globals, typescript-eslint, eslint-plugin-react

✔ Would you like to install them now?                → Yes
✔ Which package manager do you want to use?          → npm
```

> **💡 Important**
>
> Le script installant déjà ces dépendances avant cette étape, ESLint peut tout de même proposer de les installer à nouveau. Répondez simplement **Yes** afin que l'assistant termine correctement la génération de sa configuration.


## Scripts à ajouter

À la fin de l'installation, le script ouvre automatiquement un fichier contenant les scripts suivants à copier dans votre `package.json` :

```json
{
  "prepare": "node lefthook-install.js",
  "lint": "eslint .",
  "lint:fix": "eslint . --fix",
  "format": "prettier . --write",
  "format:check": "prettier . --check",
  "typecheck": "tsc --noEmit",
  "test": "vitest",
  "test:run": "vitest run"
}
```

---

## Structure

Ce script principal s'appuie sur plusieurs scripts annexes chargés de générer automatiquement les différents fichiers de configuration du projet.

Exemple :

```
create-react-app.bat
write-eslint-config-file.bat
write-prettier-related-files.bat
write-vite-config-file.bat
write-docker-related-files.bat
...
```

Cette organisation permet de maintenir facilement chaque configuration indépendamment.

---

## Objectif

L'objectif de ce projet est de supprimer les tâches répétitives lors de la création d'un nouveau projet React.

Au lieu de passer plusieurs minutes à installer des dépendances, configurer ESLint, Prettier, les tests, Docker ou encore Git Hooks, une seule commande suffit pour obtenir une base de travail propre et prête à être utilisée.

---

## Licence

Libre d'utilisation et de modification.
