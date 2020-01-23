pipeline { environment {
    registry = "kokm3/cinema_final"
    registryCredential = 'dockerpass1'
    build = '$Build_number'
}
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
          
    stage('Deploy image'){
      steps{
        script{
        docker.withRegistry('',registryCredential){dockerImage.push()}
        }
}
    }
     
        stage ('launch ec2 & install python & docker'){
        
          steps
                 {sh 'sh sudo chown root:jenkins /home/kokm/task.yml'}
                 {sh 'ansible-playbook --private-key=/home/kokm/Downloads/yuqi.pem /home/kokm/task.yml "test"'}
        }
        stage ('play jmeter script for tag_Name_test instances'){
            
          steps
           
            {sh 'export IP_new=$(<IP_new.txt'}
            {sh 'sudo sed -i s/"$IP_old"/"$IP_new"/  /var/lib/jenkins/jobs/Jmeter/Cinema.jmx'}
            {sh 'export IP_old=$IP_new'}
            {sh 'cd /opt/apache-jmeter-5.2.1/bin'}
            {sh 'jmeter.sh -Jjmeter.save.saveservice.output_format=csv -n -t /var/lib/jenkins/jobs/Jmeter/Cinema.jmx -l /var/lib/jenkins/jobs/Jmeter/test.csv'}
        }      
      
                
    }
}
       
         
