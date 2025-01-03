---
description: >-
  Cette page décrit comment réaliser une analyse de mauvaises configurations IaC
  dans des fichiers terraform.
---

# Infrastructure as Code

Pour réaliser cette analyse de mauvaises configurations, nous allons utiliser [`checkov`](https://www.checkov.io) .

Checkov est un outil opensource de contrôles de sécurité IaC. Il est également utilisé par Prisma Cloud de Palo Alto Networks pour réaliser les tâches d'analyse de code.

Dans un soucis de simplicité et de rapidité de mise en oeuvre, nous allons exécuter `checkov` via un conteneur docker avec l'image `bridgecrew/checkov`.

{% hint style="info" %}
Docker ou Docker Desktop doit être installé sur la machine utliisée pour exécuter cette analyse.
{% endhint %}

{% code overflow="wrap" %}
```bash
docker run --tty --volume ~/Dev/esgi-devsecops/terraform/aws/:/tf --workdir /tf bridgecrew/checkov -f ec2.tf
```
{% endcode %}

{% hint style="warning" %}
Le volume précisé dans la commande Docker doit correspondre à l'emplacement où vous avez réalisé le fork du repository.
{% endhint %}
