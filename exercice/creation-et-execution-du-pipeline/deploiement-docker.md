# Déploiement Docker

## **Modification du pipeline**

3 étapes sont ajoutées dans le pipeline, à ajouter en fin de liste des `stages`

* Build de l'image et push vers le Docker Hub
* Scan de vulnérabilité de l'image
* Déploiement de l'image

```javascript
stage ('Build and push to docker hub'){
            steps{
                script{
                    withDockerRegistry(credentialsId: 'docker', toolName: 'docker') {
                        sh "docker build -t petshop ."
                        sh "docker tag petshop <dockerhub username>/petshop:latest"
                        sh "docker push <dockerhub username>/petshop:latest"
                   }
                }
            }
        }
        stage("TRIVY"){
            steps{
                sh "trivy image <dockerhub username>/petshop:latest > trivy.txt"
            }
        }
        stage ('Deploy to container'){
            steps{
                sh 'docker run -d --name pet1 -p 8080:8080 <dockerhub username>/petshop:latest'
            }
        }
```

Puis lancer un nouveau build, vous pouvez suivre l'exécution du build dans la vue `Pipeline Console`

<figure><img src="../../.gitbook/assets/image (8).png" alt=""><figcaption></figcaption></figure>

Le pipeline doit, à présent, ressembler à ceci :



> On peut y voir également un graphe de tendances de l'analyse des dépendances
>
> Ainsi que l'étape d'analyse de vulnérabilités par **Trivy**

## **Image chargée dans le Docker Hub**

Vérifier que l'image a bien été poussée dans votre compte Docker Hub

<figure><img src="https://github.com/smontri/esgi-devsecops/raw/main/images/dockerhub.jpg" alt=""><figcaption></figcaption></figure>

## **Accès à l'application**

L'application est accessible via l'URL suivante : `http://<IP publique de la VM>:8080/jpetstore`

<figure><img src="https://github.com/smontri/esgi-devsecops/raw/main/images/jpetstore.jpg" alt=""><figcaption></figcaption></figure>



