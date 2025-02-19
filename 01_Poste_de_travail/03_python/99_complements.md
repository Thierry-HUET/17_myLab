# Compléments

## Les modules indispensables

### Black : Formateur de Code Python

Le module **Black** est un formateur de code Python open-source qui formate automatiquement votre code selon le guide de style PEP 8. Contrairement aux linters traditionnels qui se contentent de signaler les problèmes de style, Black reformate directement votre code pour le rendre conforme à PEP 8, sans intervention manuelle.

#### Pourquoi utiliser Black ?
- **Consistance** : Il impose un style de codage uniforme à travers tout votre code.
- **Simplicité** : Il élimine les débats sur le style de code lors des revues de code.
- **Automatisation** : Il peut être intégré dans votre flux de travail, par exemple comme hook de pré-commit.
- **Rapidité** : Il est optimisé pour formater rapidement de grands projets.

#### Installation de Black
Pour installer Black, vous pouvez utiliser pip, le gestionnaire de paquets Python. Ouvrez votre terminal et exécutez la commande suivante :
```bash
pip install black
```
Pour vérifier l’installation, vous pouvez exécuter :
```bash
black --version
```
Cela affichera la version de Black installée.

#### Utilisation de base
Pour formater un fichier Python, naviguez dans le répertoire contenant le fichier et exécutez :
```bash
black nom_du_fichier.py
```
Pour formater tous les fichiers Python dans le répertoire courant et ses sous-répertoires, utilisez :
```bash
black .
```
### Poetry : Gestionnaire de Dépendances et Packaging pour Python

**Poetry** est un outil de gestion de dépendances et de packaging pour Python. Il permet aux développeurs de déclarer, gérer et installer les bibliothèques dont leurs projets Python ont besoin, tout en s'assurant que ces dépendances sont cohérentes et correctement isolées[^1^](https://www.hymaia.com/blog/poetry-enfin-loutil-pour-charmer-python).

#### Pourquoi utiliser Poetry ?
- **Gestion simplifiée des dépendances** : Poetry gère automatiquement les versions des bibliothèques et leurs dépendances.
- **Isolation des environnements** : Il crée des environnements virtuels pour chaque projet, garantissant que les dépendances sont isolées.
- **Fichier de configuration unique** : Utilise un fichier `pyproject.toml` pour déclarer les dépendances et les configurations du projet.
- **Reproductibilité** : Le fichier `poetry.lock` garantit que les mêmes versions des dépendances sont installées à chaque fois.

#### Installation de Poetry
Pour installer Poetry, vous pouvez utiliser le script d'installation officiel. Ouvrez votre terminal et exécutez la commande suivante :

```bash
curl -sSL https://install.python-poetry.org | python3 -
````
Vous pouvez aussi opter pour l'installation via pip en utilisant la commande suivante :

```bash
pip install poetry
````

Pour vérifier l’installation, vous pouvez exécuter :

```bash
poetry --version
````

Cela affichera la version de Poetry installée.

#### Utilisation de base

##### Créer un nouveau projet
Pour créer un nouveau projet avec Poetry, utilisez la commande suivante :
```bash
poetry new nom_du_projet
````
##### Ajouter des dépendances
Pour ajouter une dépendance à votre projet, utilisez :
```bash
poetry add nom_de_la_dependance
```
##### Installer les dépendances
Pour installer les dépendances définies dans le fichier pyproject.toml, utilisez :
```bash
poetry install
```
### Jupyter

# Bibliographie

