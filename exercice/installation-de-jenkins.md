# Installation de Jenkins

L'installation se fait avec les commandes ci-dessous. Celles-ci sont regroupées dans le fichier `jenkins.sh`.

#### Créer le fichier `jenkins.sh` et y insérer le code ci-dessous.

```shell
#!/bin/bash
sudo apt update -y
wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | tee /etc/apt/keyrings/adoptium.asc
echo "deb [signed-by=/etc/apt/keyrings/adoptium.asc] https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list
sudo apt update -y
# sudo apt install temurin-17-jdk -y
sudo apt install openjdk-17-jdk -y
/usr/bin/java --version
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
                  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
                  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
                              /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install jenkins -y
sudo systemctl start jenkins
sudo systemctl status jenkins
```

#### Exécuter l'installation

```shell
sudo chmod 777 jenkins.sh 
./jenkins.sh
```

> Le port utilisé par défaut par Jenkins est le 8080, dans le cadre de cet exercice, nous allons le changer pour le port 8090 car l'application sera exposée sur le port 8080

#### Modification du port Jenkins

Pour modifier le port de Jenkins, il s'agit de modifier des fichiers de configuration dans les fichiers `/etc/default/jenkins` et `/lib/systemd/system/jenkins.service`.

1. Arrêter le service Jenkins : `sudo systemctl stop jenkins`
2. Vérifier que Jenkins est bien arrêté : `sudo systemctl status jenkins`
3. Modifier la valeur de la ligne `HTTP_PORT=` à 8090 dans `/etc/default/jenkins`
4. Modifier la valeur du port `Environments="Jenkins_port=` à 8090 dans /`lib/systemd/system/jenkins.service`
5. Redémarrer le daemon systemctl : `sudo systemctl daemon-reload`
6. Redémarrer le service Jenkins : `sudo systemctl restart jenkins`
7. Vérifier que Jenkins est bien démarré : `sudo systemctl status jenkins`

#### Première connexion à Jenkins

**Pour se connecter à Jenkins, ouvir l'URL :**

`http://<IP publique de la VM>:8090`

**Récupérer le mot de passe admin :**

`sudo cat /var/lib/jenkins/secrets/initialAdminPassword`

**Installer les plugins suggérés :**

![](../images/jenkins1.png)

**Créer un utilisateur admin**

![](../images/Jenkins2.jpg)

**Bravo vous êtes connecté à Jenkins !**

![](../images/Jenkins3.jpg)
