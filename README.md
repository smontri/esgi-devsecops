# ESGI-DevSecOps
Ce repository content les artifacts du cours DevSecOps pour l'ESGI

# Templates Terraform
Les templates AWS ou Azure sont disponibles pour déployer la VM utilisée pour les outils nécessaires à la pratique DevSecOps.

## AWS
[Fichiers Terraform pour AWS](./terraform/aws)

## Azure
[Fichiers Terraform pour Azure](./terraform/azure)

# Configuration de la VM

## Installation de Trivy
Utiliser les commandes ci-dessous pour installer Trivy

```
sudo apt-get install wget apt-transport-https gnupg lsb-release -y

wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null

echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | sudo tee -a /etc/apt/sources.list.d/trivy.list

sudo apt-get update

sudo apt-get install trivy -y
```

## Installation de Docker
Utiliser les commandes ci-dessous pour installer Docker sur la VM :

```bash
sudo apt-get update

sudo apt-get install docker.io -y 

sudo usermod -aG docker $USER 

newgrp docker 

sudo chmod 777 /var/run/docker.sock
```

# Exercice - Pipeline DevSecOps

Les composants suivants sont déployés et utilisés pour illuster un pipeline DevSecOps.

![](./images/architecture.jpg)