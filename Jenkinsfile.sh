
pipeline {
    agent any

	tools {
		maven 'maven3.6'
	}


    stages {
		stage('Clone-Repo') {
			steps {
				checkout scm
			}
		}
		stage('Build') {
	    	steps {
				sh 'mvn install -DskipTests'
			}
	    }
		stage('Unit Tests') {
			steps {
				sh 'mvn surefire:test'
			}
		}
                stage('deploy'){
		steps{
                sh 'sshpass -p "gyan@123" scp target/*.war ttomcat@172.17.0.3:/home/ttmocat/software/apache-tomcat-8.5.45/webapps'

        }
	
                        
                }       
              
}       
}


