# Installation de Docker

## Windows

### Prérequis
- Windows 10 64-bit: Pro, Enterprise, ou Education (version 1903 ou ultérieure).
- Activer la virtualisation dans le BIOS.

### Étapes d'installation
1. [Téléchargez](https://docs.docker.com/desktop/install) Docker Desktop pour Windows.
2. Exécutez le programme d'installation et suivez les instructions à l'écran.
3. Lors de l'installation, assurez-vous que l'option "Install required components for WSL 2" est cochée.
4. Redémarrez votre ordinateur si nécessaire.
5. Lancez Docker Desktop depuis le menu Démarrer.

### Vérification de l'installation
```bash
docker --version
```

## Linux

### Prérequis
- Distribution Linux (Ubuntu, Debian, Fedora, etc.).

### Étapes d'installation pour Ubuntu/Debian
1. Mettez à jour votre liste de paquets :
    ```bash
    sudo apt-get update
    ```
2. Installez les paquets nécessaires :
    ```bash
    sudo apt-get install \
        ca-certificates \
        curl \
        gnupg \
        lsb-release
    ```
3. Ajoutez la clé GPG officielle de Docker :
    ```bash
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    ```
4. Ajoutez le dépôt Docker :
    ```bash
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    ```
5. Installez Docker Engine :
    ```bash
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io
    ```

### Vérification de l'installation
```bash
docker --version
```

## macOS

### Prérequis
- macOS 10.15 ou version ultérieure.

### Étapes d'installation
1. Téléchargez Docker Desktop pour Mac.
2. Ouvrez le fichier `.dmg` et glissez Docker dans le dossier Applications.
3. Lancez Docker depuis le dossier Applications.
4. Suivez les instructions à l'écran pour terminer l'installation.

### Vérification de l'installation
```bash
docker --version
```

Pour plus de détails, vous pouvez consulter la documentation officielle de Docker.