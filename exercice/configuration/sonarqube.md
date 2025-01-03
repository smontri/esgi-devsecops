---
description: Configuration pour le plugin dans Jenkins et de la solution SonarQube
---

# SonarQube

## **Création d'une token**

Il s'agit de créer une token pour l'utilisateur admin de SonarQube qui sera utilisée par Jenkins pour invoquer SonarQube dans le pipeline.

<figure><img src="https://github.com/smontri/esgi-devsecops/raw/main/images/sonar-token.jpg" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (17).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (19).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (20).png" alt=""><figcaption></figcaption></figure>

## Ajout des credentials SonarQube dans Jenkins

La token créé précédemment doit  être utilisée pour configurer les credentials SonarQube dans Jenkins.



<figure><img src="../../.gitbook/assets/image (34).png" alt=""><figcaption></figcaption></figure>

> **Secret =** _token générée depuis SonarQube_
>
> **ID** = sonar-token
>
> **Description** = Token de credentials pour SonarQube

## **Configuration du serveur SonarQube**

Dans Jenkins - `Manage Jenkins -> System`, configurer le serveur SonarQube comme ci-dessous.

<figure><img src="../../.gitbook/assets/image (35).png" alt=""><figcaption></figcaption></figure>

> **Name** = `sonar-server`
>
> **Server URL** = `http://<IP EC2>:9000`
>
> **Server authentication token** = `sonar-token`

## **Configuration du plugin SonarQube**

Dans Jenkins - `Manage Jenkins -> Tools`, ajouter un scanner pour SonarQube

<figure><img src="https://github.com/smontri/esgi-devsecops/raw/main/images/sonar-scanner-jenkins.jpg" alt=""><figcaption></figcaption></figure>

## **Webhook pour SonarQube**

Il s'agit de configurer un webhook dans SonarQube pour récupérer les informations d'analyse dans la console Jenkins.

Depuis la console SonarQube :

<figure><img src="https://github.com/smontri/esgi-devsecops/raw/main/images/sonar-webhook.jpg" alt=""><figcaption></figcaption></figure>

**Name** : `Jenkins`

**URL** : `<http://<IP Jenkins:8090>/sonarqube-webhook/`
