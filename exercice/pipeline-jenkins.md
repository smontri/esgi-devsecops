# Pipeline Jenkins

**Etape 1 - Maven**

[![](https://github.com/smontri/esgi-devsecops/raw/main/images/pipeline1.jpg)](../images/pipeline1.jpg)

**Installation de plugins (installation sans redémarrage)**

👉 Eclipse Temurin Installer

👉 SonarQube Scanner

**Configuration des plugins**

[![](https://github.com/smontri/esgi-devsecops/raw/main/images/jdk-maven.jpg)](../images/jdk-maven.jpg)

**Création du job**

Créer un item dans Jenkins de type `Pipeline` que vous pouvez nommer `petstore`

[![](https://github.com/smontri/esgi-devsecops/raw/main/images/newitem.jpg)](../images/newitem.jpg)

Et utiliser le code ci-dessous pour définir le pipeline ;

```javascript
pipeline{
    agent any
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
```

> Attention à bien utiliser le fork du repo `jpetstore-6`, que vous avez fait avant de démarrer, dans le stage `checkout scm`.
