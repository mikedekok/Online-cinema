pipeline {
    agent any
    tools {
        maven 'Maven'
    }
    
    stages {
        
        stage ('Git & SCM') {
        
            steps { git credentialsId: 'ee0c5f74-37fb-4c3f-955f-b8814dc29faa', url: 'https://github.com/mikedekok/Online-cinema.git'}
            
        }
         stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }
        
        stage ('Build') {
            
            steps {sh 'mvn -X -Dmaven.test.failure.ignore=true clean deploy'}
          
        }
      
            
    }
}
       
