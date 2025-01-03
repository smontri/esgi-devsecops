# Etape 2 : Analyse SonarQube

Cette étape permet de configurer l'analyse de sécurité du code

##

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
