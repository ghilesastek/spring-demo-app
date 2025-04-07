pipeline {
    agent any

    tools {
        maven 'Maven 3.9.9'
        jdk 'Java 21'
    }

    environment {
        SONAR_TOKEN = credentials('sonar-token')
    }

    stages {
        stage('Cloner le projet') {
            steps {
                git credentialsId: 'github-token', url: 'https://github.com/ghilesastek/spring-demo-app.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean install -Dspring.profiles.active=ci'
            }
        }

        stage('Analyse SonarQube') {
            steps {
                withSonarQubeEnv('SonarQube Local') {
                    sh 'mvn sonar:sonar -Dspring.profiles.active=ci -Dsonar.token=$SONAR_TOKEN'
                }
            }
        }
    }
}
