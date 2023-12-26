# Installation de Sonarqube

SonarQube est un outil SAST qui permet l'analyse de sécurité du code. SonarQube est exécuté sous forme de conteneur.

```shell
docker run -d --name sonar -p 9000:9000 sonarqube:lts-community
```

Une fois le conteneur déployé, vérifiez qu'il est bien démarré et en état running[^1].

![Liste des conteneurs](../images/docker-sonarqube.jpg)

#### Connnexion à SonarQube

`http://<IP publique de la VM>:9000`

Les credentials à utiliser pour la première connexion sont `admin/admin`.

> SonarQube vous demande de modifier le mot de passe admin

Voici la console de SonarQube :

![](../images/sonarqube1.jpg)

###

[^1]: 
