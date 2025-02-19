Voici une procédure d'installation pour `virtualenv` sur Windows, Linux et macOS, formatée en Markdown :
# Installation de Virtualenv

## Prérequis
- Python installé sur votre système (version 3.7 ou supérieure recommandée)
- Pip (gestionnaire de paquets Python)

## Installation sur Windows

1. **Installer Virtualenv** :
    ```{code-block} sh
    pip install virtualenv
    ```

2. **Créer un environnement virtuel** :
    ```{code-block} sh
    python -m virtualenv mon_env
    ```

3. **Activer l'environnement virtuel** :
    ```{code-block} sh
    .\mon_env\Scripts\activate
    ```

4. **Désactiver l'environnement virtuel** :
    ```{code-block} sh
    deactivate
    ```

## Installation sur Linux

1. **Installer Virtualenv** :
    ```{code-block} sh
    pip install virtualenv
    ```

2. **Créer un environnement virtuel** :
    ```{code-block} sh
    python3 -m virtualenv mon_env
    ```

3. **Activer l'environnement virtuel** :
    ```{code-block} sh
    source mon_env/bin/activate
    ```

4. **Désactiver l'environnement virtuel** :
    ```{code-block} sh
    deactivate
    ```

## Installation sur macOS

1. **Installer Virtualenv** :
    ```{code-block} sh
    pip install virtualenv
    ```

2. **Créer un environnement virtuel** :
    ```{code-block} sh
    python3 -m virtualenv mon_env
    ```

3. **Activer l'environnement virtuel** :
    ```{code-block} sh
    source mon_env/bin/activate
    ```

4. **Désactiver l'environnement virtuel** :
    ```{code-block} sh
    deactivate
    ```

## Notes supplémentaires
- Pour vérifier que `virtualenv` est bien installé, vous pouvez utiliser la commande suivante :
    ```{code-block} sh
    virtualenv --version
    ```
- Vous pouvez également utiliser `pipx` pour installer `virtualenv` dans un environnement isolé.
