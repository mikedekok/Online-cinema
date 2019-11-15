Jenkinsfile (Declarative Pipeline)
pipeline {
    agent any
    tools {
        maven 'maven'
        jdk 'jdk'
    }
    stages {

        stage ('Build') {
            steps {
                sh 'mvn -Dmaven.test.failure.ignore=true install' 
                sh 'make' 
                archiveArtifacts artifacts: '**/target/*.war', fingerprint: true 
            }
            post {
                success {
                    junit 'target/surefire-reports/**/*.xml' 
                }
            }
        }
    }
}
       
