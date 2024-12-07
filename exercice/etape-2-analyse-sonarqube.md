# Etape 2 : Analyse SonarQube

Cette étape permet de configurer l'analyse de sécurité du code

## Installation du plugin SonarQube

L'installation se fait via le menu `Manage Jenkins -> Plugins`

Dans la catégorie `Available plugins`, sélectionner `SonarQube Scanner`

<figure><img src="../.gitbook/assets/image (21).png" alt=""><figcaption></figcaption></figure>

## **Création d'une token**

Il s'agit de créer une token pour l'utilisateur admin de SonarQube qui sera utilisée par Jenkins pour invoquer SonarQube dans le pipeline.

<figure><img src="https://github.com/smontri/esgi-devsecops/raw/main/images/sonar-token.jpg" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (17).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (19).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (20).png" alt=""><figcaption></figcaption></figure>

## Ajout des credentials SonarQube dans Jenkins

Cette token doit ensuite être utilisée pour configurer les credentials Sonar dans Jenkins.

<figure><img src="https://github.com/smontri/esgi-devsecops/raw/main/images/sonar-token-jenkins.jpg" alt=""><figcaption></figcaption></figure>

> **Secret =** token générée précédemment
>
> **ID** = sonar-token
>
> **Description** = sonar-token

## **Configuration du serveur SonarQube**

Dans Jenkins - `Manage Jenkins -> System`, configurer le serveur SonarQube comme ci-dessous.

<figure><img src="https://github.com/smontri/esgi-devsecops/raw/main/images/sonar-server-jenkins.jpg" alt=""><figcaption></figcaption></figure>

{% hint style="warning" %}
Remplacer l'adresse IP du serveur par celle de la VM
{% endhint %}

## **Configuration du plugin SonarQube**

Dans Jenkins - `Manage Jenkins -> Tools`, ajouter un scanner pour SonarQube

<figure><img src="https://github.com/smontri/esgi-devsecops/raw/main/images/sonar-scanner-jenkins.jpg" alt=""><figcaption></figcaption></figure>

## **Ajout d'une quality gate dans SonarQube**

Il s'agit de configurer un webhook dans SonarQube pour récupérer les informations dans la console Jenkins.

Depuis la console SonarQube :

<figure><img src="https://github.com/smontri/esgi-devsecops/raw/main/images/sonar-webhook.jpg" alt=""><figcaption></figcaption></figure>

**Name** : `Jenkins`

**URL** : `<http://<IP Jenkins:8090>/sonarqube-webhook/`

## **Modification de la définition du pipeline**

Nous allons ajouter 2 étapes au pipeline ainsi que des informations d'environnement pour l'utilisation du scanner SonarQube.

### Environnement du scanner

{% hint style="info" %}
A ajouter sous la section `tools` de la définition du pipeline
{% endhint %}

```javascript
environment {
        SCANNER_HOME=tool 'sonar-scanner'
    }
```

Ajout des étapes du pipeline, à ajouter en fin de liste des `stages`

```java
stage("Sonarqube Analysis "){
            steps{
                withSonarQubeEnv('sonar-server') {
                    sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=Petshop \
                    -Dsonar.java.binaries=. \
                    -Dsonar.projectKey=Petshop '''
                }
            }
        }
stage("quality gate"){
           steps {
                script {
                  waitForQualityGate abortPipeline: false, credentialsId: 'Sonar-token' 
                }
           }
        }
```



<figure><img src="../.gitbook/assets/image (13).png" alt="" width="358"><figcaption></figcaption></figure>

Le pipeline doit, à présent, ressembler à ceci :

<figure><img src="https://github.com/smontri/esgi-devsecops/raw/main/images/Job2.jpg" alt=""><figcaption></figcaption></figure>

Et vous pouvez consulter le résultat de l'analyse SonarQube dans la vue `Projects` de la console :

<figure><img src="https://github.com/smontri/esgi-devsecops/raw/main/images/sonar-results.jpg" alt=""><figcaption></figcaption></figure>
