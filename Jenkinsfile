pipeline {
    agent any
    tools {
        maven 'maven'
    }
    stages {
        stage ('Git') {
        steps { git credentialsId: 'ee0c5f74-37fb-4c3f-955f-b8814dc29faa', url: 'https://github.com/mikedekok/Online-cinema.git'}}
        stage ('Build') {
            steps {
                sh 'mvn -Dmaven.test.failure.ignore=true clean package' 
               
            }
          
        }
    }
}
       
