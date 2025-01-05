---
description: >-
  Trivy est une solution OpenSource d'analyse de mauvaises configurations IaC,
  de vulnérabilités dans les packages OpenSource et les images Docker, de
  secrets, de licences.
---

# Trivy

Utiliser les commandes ci-dessous pour installer Trivy sur la VM

```shell
sudo apt-get install wget apt-transport-https gnupg lsb-release -y

wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null

echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | sudo tee -a /etc/apt/sources.list.d/trivy.list

sudo apt-get update

sudo apt-get install trivy -y
```
