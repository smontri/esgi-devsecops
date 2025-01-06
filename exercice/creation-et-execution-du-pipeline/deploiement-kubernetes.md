# Déploiement Kubernetes

Ajout du stage de déploiement de Kubernetes

### Adaptation du déploiement

Il s'agit de remplacer l'image définie dans l'objet `deployment` par celle qui point vers votre compte Docker Hub.

<figure><img src="../../.gitbook/assets/image (2) (1) (1).png" alt=""><figcaption></figcaption></figure>

{% hint style="warning" %}
Attention cette modification doit être faite dans votre fork du repository `jpestore-6`
{% endhint %}

### Ajout du step K8s

{% hint style="info" %}
A ajouter à la fin de la liste des steps du workflow
{% endhint %}

```javascript
stage('K8s'){
            steps{
                script{
                    withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'k8s', namespace: '', restrictKubeConfigAccess: false, serverUrl: '') {
                        sh 'kubectl create ns <votre namespace>'
                        sh 'kubectl apply -f deployment.yaml -n <votre namespace>'
                    }
                }
            }
        }
```

{% hint style="danger" %}
<mark style="color:red;">**Le namespace est crée par le pipeline, attention à lui donner le nom de votre groupe**</mark>
{% endhint %}

Puis lancer un nouveau build, vous pouvez suivre l'exécution du build dans la vue `Pipeline Console`

<figure><img src="../../.gitbook/assets/image (8).png" alt=""><figcaption></figcaption></figure>

Le pipeline doit, à présent, ressembler à ceci :

<figure><img src="../../.gitbook/assets/image.png" alt=""><figcaption></figcaption></figure>

## Accès à l'application

<figure><img src="../../.gitbook/assets/image (1).png" alt=""><figcaption></figcaption></figure>

Pour accéder à l'application que vous avez déployé, visitez l'url suivante

`http://<IP LoadBalancer>/jpetstore`

{% hint style="info" %}
Demandez l'IP du LoadBalancer à votre intervenant
{% endhint %}
