pipeline { environment {
    registry = "kokm3/cinema_final"
    registryCredential = 'dockerpass1'}
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

             steps{checkout scm}
    }
        
        stage ('Build') {
            
            steps {sh 'mvn -X -Dmaven.test.failure.ignore=true clean deploy'}
                      
        }
        stage('Building image'){
      steps{
        script{
          dockerImage = docker.build registry + ":$Build_number"
        }
      } 
          
}
            stage ("getting buildnumber") {
                steps{
                    script{
                 buildnumber = manager.build.getEnvironment(manager.listener)['BUILD_NUMBER']
                    }}}
               
            
                              

    stage('Deploy image'){
      steps{
        script{
        docker.withRegistry('',registryCredential){dockerImage.push()}
        }
}
    }
     
        stage ('launch & provision'){
        
          steps
                 {sh 'sh sudo chown root:jenkins /home/kokm/task.yml'}
                 {sh 'ansible-playbook --private-key=/home/kokm/Downloads/yuqi.pem /home/kokm/task.yml'}

          
        }
      
            
    }
}
       
         
