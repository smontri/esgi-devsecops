---
description: Comment accéder en SSH à la VM crée
---

# Accès à la VM

Le code Terraform utilisé pour créer la VM s'appuie sur une paire de clés SSH nommée `vockey` qui est crée automatiquement par les labs AWS dans la région `us-east-1`.

La clé publique est copiée automatiquement sur la VM, alors que la clé privée doit être téléchargée sur votre poste de travail.

Pour se connecter à la VM, utiliser `Putty` (Windows) ou `ssh` (Linux, MacOS, Windows WSL2).

Dans Putty, il faudra configurer la clé SSH dans les informations de la connexion.

_En commande ssh :_

```bash
ssh -i labuser.pem ubuntu@<adresse ip>
```

{% hint style="info" %}
La clé SSH téléchargée depuis le lab AWS s'appelle `labuser.pem`, attention de vérifier son nom et où elle a été téléchargée

Remplacer \<adresse ip> par l'adresse ip publique fournie en résultat de la commande terraform

L'utilisateur à utiliser est `ubuntu` car il s'agit d'une VM Ubuntu
{% endhint %}

<figure><img src="../.gitbook/assets/image (11).png" alt=""><figcaption></figcaption></figure>

<mark style="color:red;">**Bravo ! Vous êtes connectés sur votre VM.**</mark>
