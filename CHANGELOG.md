# Changelog

Toutes les évolutions notables de ce projet sont documentées ici.  
Format : [Keep a Changelog](https://keepachangelog.com/fr/1.0.0/) — versioning [SemVer](https://semver.org/lang/fr/).

---

## [1.8.1] — 2026-06-18

### Modifié — 04030102.md (M2)
- Renumérotation complète : EX-12–EX-20 → EX-01–EX-09, labels MyST mis à jour (`redmine_m2_ex0x`) pour éviter toute collision avec M1/M3
- Projet fil rouge renommé : `mon-projet` / `Formation Redmine` → `gestion-sinistres` / `Gestion des sinistres` / `gestion-sinistres-batch` — propagé dans toutes les solutions et commandes API
- EX-04 (lot de demandes) : ajout de 3 voies de création — A (interface), B (import CSV avec fichier prêt et note plugin redmine_importer), C (API REST PowerShell avec appels de contrôle préalables et table de correspondance ids)
- EX-05 (Wiki) : ajout tableau de syntaxe Markdown CommonMark (10 éléments — titres, gras, italique, listes, liens internes, tableaux, blocs de code) ; note de basculement Textile pour instances non configurées en M1
- EX-06 (temps) : ajout voie B saisie via API (`POST /time_entries.json`) et 3 requêtes GET de consultation (projet, demande, utilisateur) ; note sur `spent_on` et absence de total calculé par l'API

---

## [1.8.0] — 2026-06-18

### Modifié — 04030101.md (M1)
- EX-02 : correction menu API REST + vérification fonctionnelle curl (zsh et PowerShell)
- EX-03 : ajout statut "En attente client", mise à jour matrice workflow Développeur/Anomalie (8 statuts), remplacement référence image par matrice textuelle complète
- EX-04 : correction séquençage (statuts avant trackers), note "Statut par défaut = Nouveau (créé à EX-03)"
- EX-05 : refonte complète (3 rôles détaillés avec visibilité, permissions par section, table restriction par tracker)
- EX-07 : correction chemin menu (Listes de valeurs), libellés "Actif" et "Valeur par défaut" alignés sur l'interface réelle
- EX-08 : remplacement "En attente client" absent → présent, correction "Assistance" → "Demande de service", matrice format Depuis/Vers
- EX-09 : ajout étape 0 (création projet via API), variantes PowerShell/zsh, table status\_id alignée sur EX-03

### Ajouté — 04030101.md (M1)
- EX-12 (avancé) : Export Redmine → Excel via n8n — workflow 7 nœuds, mise à jour fichier existant sur disque hôte via volume Docker

---

## [1.7.1] — 2026-06-17

### Modifié
- 04030101.md, 04030102.md, 04030103.md : alignement de tous les exercices sur le modèle de numérotation de l'exercice 1 M1
  - Titre sorti de la directive `exercise` vers un heading `### Exercice N - Titre`
  - Directive `::::{exercise}` sans titre inline ni `:nonumber:`
  - Labels inchangés
- 04030103.md : renumérotation M3 (EX-14→19 → 21→26) en continuité de M2
- 04030103.md : ajout des 6 solutions dropdown (sol_redmine_ex21 à sol_redmine_ex26) absentes de la version initiale

---

## [1.7.0] — 2026-06-17

### Ajouté
- Module 03_Infrastructure/01_docker/03010101.md : refonte complète du fichier d'exercices conteneurs & images
  - Prérequis en tête de page (Linux, réseau, terminal, WSL2)
  - Note WSL2 pour les utilisateurs Windows (recommandation d'environnement)
  - 13 exercices numérotés (01 à 13) avec solutions en dropdown
  - Exercice 01 : installation Docker, explication annotée de `docker info`
  - Exercice 02 : prise en main Docker Desktop (Windows/macOS), correspondance Desktop ↓ CLI
  - Exercice 03 : syntaxe et aide en ligne, tableau ancienne/moderne syntaxe
  - Exercice 04 : limiter et surveiller les ressources (Cgroups) — `--memory`, `--cpus`, OOM Killer, `docker update`
  - Exercice 05 : isolation des processus et diagnostic (Namespaces) — `docker top`, `/proc/1/status`, `nsenter`
  - Exercice 06 : empreinte mémoire et temps de démarrage (9 étapes, Linux uniquement pour 7–9)
  - Exercices 07–08 : coexistence de versions, déploiement rapide (WordPress)
  - Exercices 09–11 : cycle de vie, supervision, variables d'environnement
  - Exercice 12 : construire une image Dockerfile, publication Docker Hub (création repository incluse)
  - Exercice 13 : optimiser un Dockerfile + montage répertoire local pour édition `app.py` à chaud
  - Nettoyage systématique (`docker image prune -f` + `docker volume prune -f`) dans tous les exercices
- Répertoire `03_Infrastructure/01_docker/files/` : 7 fichiers sources pour `literalinclude`
  - `mariadb.env`, `index.html`, `Dockerfile.nginx` (commenté), `app.py`, `Dockerfile.avant`, `Dockerfile.apres`, `requirements.txt`
- `aperto.css` : règle CSS ajoutée pour aligner la police des dropdowns `sd-dropdown` sur le reste du contenu (14px, QuickSand)

### Modifié
- `footer.md` : mise à jour de la date à 06/2026

---

## [1.6.0] — 2026-06-15

### Ajouté
- Module 03_Infrastructure/05_apache_camel : intégration Apache Camel + Karavan
  - 030500.md : index du module avec plan de navigation
  - 03050100.md : installation via Docker (Camel, Karavan, MS-SQL, PostgreSQL) avec docker-compose.yml et scripts d'initialisation
  - 03050200.md : route YAML de recopie MS-SQL → PostgreSQL (SELECT, Split, upsert, conversions de types, pagination)

### Modifié
- myst.yml : ajout du module 05_apache_camel dans le TOC de 03_Infrastructure

---

## [1.5.1] — 2026-06-15

### Modifié
- 04030100.md : suppression des références à la TMA et à Capgemini dans la page de présentation
- 04030101.md : exercices M1 enrichis (EX-02 étendu à tous les onglets de configuration avec captures réelles), 4 exercices avancés ajoutés (workflow multi-rôles, API REST curl, import CSV, champs personnalisés), corrections dropdown ajoutées sur les 11 exercices, durées révisées
- 04030102.md : exercices M2 enrichis (3 exercices avancés ajoutés : filtres personnalisés, roadmap/Gantt, API REST gestion de projet), corrections dropdown ajoutées sur les 6 exercices, durées révisées
- Suppression de toutes les références à "Capgemini" et "TMA" dans les fichiers du module Redmine — remplacées par des termes génériques (`mon-projet`, `Formation Redmine`, "support et maintenance")

### Corrigé
- EX-02 M1 : champs de configuration corrigés selon l'interface réelle Redmine 5.1.12 (onglets Général, Affichage, Authentification, API, Projets, Suivi des demandes, Suivi du temps, Fichiers)
- Doublons de frontmatter dans 04030101.md supprimés

---

## [1.5.0] — 2026-06-13

### Ajouté
- Module 04_Application/03_Tests/01_Redmine : parcours d'exercices Redmine 5.1.12
  - 040301.md : index du module avec plan de navigation M1/M2/M3
  - 040301_M1.md : 7 exercices Administration (Docker, trackers, workflow, rôles, comptes, activités)
  - 040301_M2.md : 6 exercices Gestion de projet (création projet, membres, versions, demandes, wiki, temps)
  - 040301_M3.md : 6 exercices Usage quotidien (personnalisation, cycle de vie ticket, sous-tâches, livrables, défi final)

### Modifié
- myst.yml : correction du TOC 04_Application/03_Tests — remplacement des entrées erronées 02_Cyber par la hiérarchie Redmine

### Corrigé
- TOC 040300.md pointait vers les fichiers 04_Application/02_Cyber au lieu de 04_Application/03_Tests

---

## [1.4.0] — 2026-04-05

### Ajouté
- Série de contenus (8 commits du 05/04/2026) — extensions et approfondissements de modules existants

---

## [1.3.0] — 2026-01-20

### Ajouté
- Contenu 2026-01-20 — ajouts divers au site

---

## [1.2.0] — 2025-11-10 → 2025-12-02

### Ajouté
- Série de modules Python avancé : 02060600 à 02060700 (séries 05, 06, 07)
- Compléments modules Programmation et Infrastructure (commits nov.–déc. 2025)

---

## [1.1.0] — 2025-09-03 → 2025-10-02

### Ajouté
- Modules Python avancé : 02060400 (8 sous-modules), 02060500 (6 sous-modules)
- Ajouts Infrastructure et Benchmark (sept.–oct. 2025)
- Module RPA : 02040100, 02040200, 02040300

### Modifié
- Refonte progressive du contenu Python avancé 020600

---

## [1.0.0] — 2025-05-12 → 2025-08-14

### Ajouté
- Module Python avancé 020600 : structure initiale et premiers sous-modules (02060100 à 02060300)
- Prise en compte du canal Element (matrix.to) dans la navigation
- Ajout du style CSS personnalisé (aperto.css)
- Modules SQL : 02020100 à 02021000 (10 exercices)
- Modules Cypher : 02030100
- Module GraphQL : 02050100
- Module Ada : 020700
- Infrastructure : MongoDB 030200, Solr 030300, Admin Linux 030400
- Benchmark : Loading 050100, Databases 050200

### Modifié
- Mise à jour de l'index général (myst.yml TOC complet)

---

## [0.2.0] — 2025-02-20 → 2025-03-05

### Ajouté
- Modules Python de base : 02010100 à 02010700 (syntaxe, structures, algorithmes, POO)
- Module Containerisation / Docker poste de travail : 010200
- Module IDE : 010100
- Module Python poste de travail : 010300
- CSS personnalisé initial

### Modifié
- Structure myst.yml : ajout TOC complet pour 01_Poste_de_travail et 02_Programmation

---

## [0.1.0] — 2025-02-19

### Ajouté
- Initialisation du dépôt depuis GitHub (clone)
- Premier import : structure de base du site MyST
- Configuration myst.yml initiale (template book-theme, favicon, logo, analytics)
- Readme.md, LICENSE (CC-BY-4.0), CODE_OF_CONDUCT.md, SECURITY.md
- Dockerfile et Makefile initiaux
