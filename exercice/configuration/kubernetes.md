# Kubernetes

## Ajout des credentials Kubernetes

Depuis `Manage Jenkins ⇒ Credentials`, ajouter les credentials pour le cluster Kubernetes comme indiqué ci-dessous

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
