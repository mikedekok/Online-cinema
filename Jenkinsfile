pipeline {
    agent any
    tools {
        maven 'Maven'
    }
    
    stages {
        
        stage ('Git') {
        
            steps { git credentialsId: 'ee0c5f74-37fb-4c3f-955f-b8814dc29faa', url: 'https://github.com/mikedekok/Online-cinema.git'}
        }
        
        stage ('Build') {
            
            steps {sh 'mvn -X -Dmaven.test.failure.ignore=true clean deploy'}
          
        }
      
            
    }
}
       
