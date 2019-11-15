pipeline {
    agent any
    tools {
        maven 'maven'
    }
    stages {
        stage ('Git') {
        steps { git credentialsId: 'd1096f94-70cb-4942-ac85-443fae9bef54', url: 'https://github.com/oneaqi/Javaweb_nexus.git'}}
        stage ('Build') {
            steps {
                sh 'mvn -Dmaven.test.failure.ignore=true clean deploy' 
               
            }
          
        }
    }
}
       
