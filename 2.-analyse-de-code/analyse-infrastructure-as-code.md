---
description: Cette page décrit comment réaliser une analyse de mauvaises configurations IaC
---

# Analyse Infrastructure as Code

## Outil

Pour réaliser cette analyse de mauvaises configurations, nous allons utiliser [`checkov`](https://www.checkov.io) .

Checkov est un outil opensource de contrôles de sécurité IaC. Il est également&#x20;

`docker run --tty --volume ~/Dev/esgi-devsecops/terraform/aws/:/tf --workdir /tf bridgecrew/checkov -f ec2.tf`
