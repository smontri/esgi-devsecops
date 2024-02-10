# Etape 3 : Dépendances OWASP

## Installation du plugin Dependency-check

Pour effectuer cette analyse, on s'appuie sur un plugin Jenkins `OWASP Dependency check`.

A installer via `Manage Jenkins -> Plugins`

<figure><img src="https://github.com/smontri/esgi-devsecops/raw/main/images/jenkins-owasp.jpg" alt=""><figcaption></figcaption></figure>

## Configuration du plugin Dependency-check

A configurer via `Manage Jenkins -> Tools`

<figure><img src="https://github.com/smontri/esgi-devsecops/raw/main/images/dp-config.jpg" alt=""><figcaption></figcaption></figure>

## Ajout du stage OWASP Check

{% hint style="info" %}
A ajouter à la fin de la liste des steps du workflow
{% endhint %}

```javascript
stage ('Build war file'){
            steps{
                sh 'mvn clean install -DskipTests=true'
            }
        }
        stage("OWASP Dependency Check"){
            steps{
                dependencyCheck additionalArguments: '--scan ./ --format XML ', odcInstallation: 'DP-Check'
                dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
            }
        }
```

## Lancer le build du pipeline&#x20;

<figure><img src="../.gitbook/assets/image (14).png" alt="" width="358"><figcaption></figcaption></figure>

Le pipeline doit, à présent, ressembler à ceci :

<figure><img src="https://github.com/smontri/esgi-devsecops/raw/main/images/Job3.jpg" alt=""><figcaption></figcaption></figure>

Et pour visualiser le résultat de check des dépendances :

<figure><img src="https://github.com/smontri/esgi-devsecops/raw/main/images/dp-results.jpg" alt=""><figcaption></figcaption></figure>



\
