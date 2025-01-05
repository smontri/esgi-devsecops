# Dépendances OWASP

## Modification du pipeline

Ajout cette étape dans le pipeline, à ajouter en fin de liste des `stages`

```javascript
stage ('Build war file'){
            steps{
                sh 'mvn clean install -DskipTests=true'
            }
        }
        stage("OWASP Dependency Check"){
            steps{
                dependencyCheck additionalArguments: '--scan ./ --format XML --nvdApiKey $NVD_API_KEY', odcInstallation: 'DP-Check'
                dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
            }
        }
```

Puis lancer un nouveau build, vous pouvez suivre l'exécution du build dans la vue `Pipeline Console`

<figure><img src="../../.gitbook/assets/image (8).png" alt=""><figcaption></figcaption></figure>

Le pipeline doit, à présent, ressembler à ceci :

<figure><img src="../../.gitbook/assets/image (38).png" alt=""><figcaption></figcaption></figure>

Et pour visualiser le résultat de check des dépendances :

<figure><img src="../../.gitbook/assets/image (9).png" alt=""><figcaption></figcaption></figure>
