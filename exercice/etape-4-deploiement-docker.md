# Etape 4 : Déploiement Docker

## **Ajout des plugins Docker**

Il s'agit d'ajouter les plugins suivants pour utiliser Docker avec Jenkins

* `Docker`
* `Docker Commons`
* `Docker Pipeline`
* `Docker API`
* `docker-build-step`

<figure><img src="https://github.com/smontri/esgi-devsecops/raw/main/images/docker-plugins.jpg" alt=""><figcaption></figcaption></figure>

## **Configuration du plugin Docker dans Jenkins**

<figure><img src="https://github.com/smontri/esgi-devsecops/raw/main/images/docker-config.jpg" alt=""><figcaption></figcaption></figure>

## **Ajout des credentials pour Docker Hub**

{% hint style="danger" %}
<mark style="color:red;">**Vous devez avoir un compte Docker Hub**</mark>
{% endhint %}

<figure><img src="https://github.com/smontri/esgi-devsecops/raw/main/images/docker-creds.jpg" alt=""><figcaption></figcaption></figure>

## **Ajout stage Docker dans le pipeline**

3 étapes sont ajoutées&#x20;

* Build de l'image et push vers le Docker Hub
* Scan de vulnérabilité de l'image
* Déploiement de l'image

{% hint style="info" %}
A ajouter à la fin de la liste des steps du workflow
{% endhint %}

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

## Lancer le build du pipeline&#x20;

<figure><img src="../.gitbook/assets/image (15).png" alt="" width="358"><figcaption></figcaption></figure>

Le pipeline doit, à présent, ressembler à ceci :

<figure><img src="https://github.com/smontri/esgi-devsecops/raw/main/images/Job4.jpg" alt=""><figcaption></figcaption></figure>

> On peut y voir également un graphe de tendances de l'analyse des dépendances
>
> Ainsi que l'étape d'analyse de vulnérabilités par **Trivy**

## **Image chargée dans le Docker Hub**

Vérifier que l'image a bien été poussée dans votre compte Docker Hub

<figure><img src="https://github.com/smontri/esgi-devsecops/raw/main/images/dockerhub.jpg" alt=""><figcaption></figcaption></figure>

## **Accès à l'application**

L'application est accessible via l'URL suivante : `http://<IP publique de la VM>:8080/jpetstore`

<figure><img src="https://github.com/smontri/esgi-devsecops/raw/main/images/jpetstore.jpg" alt=""><figcaption></figcaption></figure>
