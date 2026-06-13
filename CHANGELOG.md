# Changelog

Toutes les évolutions notables de ce projet sont documentées ici.  
Format : [Keep a Changelog](https://keepachangelog.com/fr/1.0.0/) — versioning [SemVer](https://semver.org/lang/fr/).

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
