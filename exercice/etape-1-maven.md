# Etape 1 : Maven



## Configuration du plugin Temurin

Pour configurer le plugin comme indiqué ci-dessous, `Manage Jenkins -> Tools`

<figure><img src="../.gitbook/assets/image (7).png" alt=""><figcaption></figcaption></figure>

## Création du job Jenkins

Créer un item dans Jenkins de type `Pipeline` que vous pouvez nommer `petstore`

<figure><img src="../.gitbook/assets/image (1) (1).png" alt=""><figcaption></figcaption></figure>

Et utliser le code ci-dessous pour définir le workflow du pipeline dans le bloc `Pipeline`

<pre class="language-javascript"><code class="lang-javascript"><strong>pipeline{
</strong>    agent any
    tools {
        jdk 'jdk17'
        maven 'maven3'
    }
    stages{
        stage ('clean Workspace'){
            steps{
                cleanWs()
            }
        }
        stage ('checkout scm') {
            steps {
                git 'https://github.com/smontri/jpetstore-6.git'
            }
        }
        stage ('maven compile') {
            steps {
                sh 'mvn clean compile'
            }
        }
        stage ('maven Test') {
            steps {
                sh 'mvn test'
            }
        }
   }
}
</code></pre>

{% hint style="danger" %}
<mark style="color:orange;">**Utiliser votre fork du repository dans le stage**</mark><mark style="color:orange;">**&#x20;**</mark><mark style="color:orange;">**`checkout scm`**</mark>
{% endhint %}

<figure><img src="../.gitbook/assets/image (3).png" alt=""><figcaption></figcaption></figure>

## Lancer le build du pipeline

<figure><img src="../.gitbook/assets/image (12).png" alt="" width="358"><figcaption></figcaption></figure>
