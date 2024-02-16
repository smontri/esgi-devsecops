# Etape 5 : Déploiement Kubernetes

A présent, nous allons déployer l'application vers un cluster Kubernetes

## **Ajout des plugins Kubernetes**

Pour que Jenkins puisse intéragir avec le cluster Kubernetes, il s'agit d'installer les plugins suivants dans Jenkins via `Manage Jenkins -> Plugins`

* `Kubernetes`&#x20;
* `Kubernetes Client API`
* `Kubernetes Credentials`
* `Kubernetes CLI`

<figure><img src="https://github.com/smontri/esgi-devsecops/raw/main/images/kubernetes-plugins.jpg" alt=""><figcaption></figcaption></figure>

## Ajout des credentials Kubernetes

Depuis `Manage Jenkins -> Credentials`, ajouter les credentials pour le cluster Kubernetes comme indiqué ci-dessous

<figure><img src="https://github.com/smontri/esgi-devsecops/raw/main/images/k8s-creds.jpg" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
Il s'agit d'ajouter le fichier de config pour le cluster Kubernetes cible, à demander à votre intervenant
{% endhint %}

## Installation de la commande kubectl

La commande `kubectl` permet d'intéragir avec l'API Kubernetes, et celle-ci doit être installée sur la VM.

```javascript
sudo apt update
sudo apt install curl
curl -LO https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client
```

## Ajout du stage de déploiement de Kubernetes

### Adaptation du déploiement

Il s'agit de remplacer l'image définie dans l'objet `deployment` par celle qui point vers votre compte Docker Hub.

<figure><img src="../.gitbook/assets/image.png" alt=""><figcaption></figcaption></figure>

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

## Lancer le build du pipeline

<figure><img src="../.gitbook/assets/image (16).png" alt="" width="358"><figcaption></figcaption></figure>
