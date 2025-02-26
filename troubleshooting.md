# Troubleshooting

Au cas où le Lab AWS s'est arrêté, voici les étapes à suivre :

* Redémarrer le lab AWS, bouton `Start Lab`

<figure><img src=".gitbook/assets/image (40).png" alt=""><figcaption></figcaption></figure>

* La VM est toujours présente, il se peut qu'elle soit en statut stopped, dans ce cas la redémarrer depuis la console AWS (url AWS SSO)
  * si besoin de redémarrer la VM, il faudra redémarrer le container Sonarqube
*   Récupérer la nouvelle adresse IP

    * via la console AWS&#x20;
    * via la commande `aws ec2 describe-instances`


* Modifier l'IP dans la configuration de Jenkins (l'interface sera vraiment lente pour y accéder)

<figure><img src=".gitbook/assets/image (41).png" alt=""><figcaption></figcaption></figure>

* Modifier l'IP dans le Webhook dans Sonarqube

<figure><img src=".gitbook/assets/image (43).png" alt=""><figcaption></figcaption></figure>

* Modifier l'IP du serveur Sonar

<figure><img src=".gitbook/assets/image (42).png" alt=""><figcaption></figcaption></figure>
