---
title: Configurer son environnement
author: Thierry HUET - APERTO-NOTA - contact@aperto-nota.fr
exports:
  - format: pdf
    language: fr
    template: lapreprint
    date: 2024-06-26
---

# Les étapes
::::{figure}
:label: fig1
:width: 75%
:align: center

:::{mermaid}

flowchart LR

    classDef node1 fill:#0692,stroke:#069,stroke-width:1px,color:#069,font-size:10pt

    A1(Installer python):::node1
    A2(Installer son EDI):::node1
    A3(Préparer son environnement):::node1

    A1 --> A2 --> A3

:::
::::

# Contexte d'utilisation
Les IDE sont utilisés dans divers contextes de développement logiciel, allant des applications web aux logiciels embarqués. Ils permettent aux développeurs de coder, tester et déboguer leurs applications de manière plus efficace. Par exemple, dans le cadre d'un projet informatique, un IDE peut être utilisé pour développer et maintenir un site web, une application mobile, etc.

# Installer son EDI

Un EDI (**E**nvironnement de **D**éveloppement **I**ntégré en français) est une plateforme de développement permettant de manipuler plus facilement les programmes écrits en Python.

Plusieurs solutions existent ([Spyder](https://www.spyder-ide.org/), [Eclipse](https://www.eclipse.org), [pyCharm](https://www.jetbrains.com/pycharm/download/), etc.). Je préconise cependant d'utiliser **VSCode**, la solution de Microsoft. Elle est simple à installer, facile à utiliser et répond à une grande partie de nos besoins.
:::{figure} img/ide-logo-1392x677.png
:align: center
:width: 75%
:::
Si vous utilisez Windows, la solution la plus simple est de passer par le Windows Store ou de télécharger et installer le package à partir du site de [Microsoft](https://code.visualstudio.com/download>).
Si vous êtes dans un environnement autre que Windows, la même URL vous permettra de télécharger et installer l'application sur votre poste. 
:::{figure} img/install_vscode.png
:align: center
:width: 75%
:::
**Rappel** Il n'est pas utile d'être administrateur pour installer un produit via Windows Store.

:::{note}
- Ne confondez pas environnement de programmation/exécution et environnement de développement. On peut très bien développer à partir de Windows et exécuter nos programmes dans un environnement Linux.
- Un IDE n'est pas limité à un seul langage de programmation. Vous pouvez le configurer pour qu'il soit compatible avec d'autres langages.
:::

# Préparer son environnement

Ouvrir VSCode en cliquant sur l'icône correspondante dans la barre de menu.

:::{figure} img/vscode.png
:::

Nous allons préparer notre environnement en installant des modules spécifiques.

* Installer le package de langue française.

:::{figure} img/french_pack.png
:width: 300px
:align: left
:::

* Installer ensuite les modules liés à python si necessaires.

:::{figure} img/modules_python.png
:width: 300px
:align: left
:::
