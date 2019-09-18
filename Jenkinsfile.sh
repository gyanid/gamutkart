
pipeline {
    agent any

	tools {
		maven 'maven3.6.2'
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
                sh 'sshpass -p "kamesh532@" scp target/*.war kamesh@172.17.0.2:/home/apache-tomcat-8.5.43/webapps'
sh 'sshpass -p "kamesh532@" ssh kamesh@172.17.0.2 "JAVA_HOME=/home/jdk1.8.0_221" "/home/apache-tomcat-8.5.43/bin/startup.sh"'
        }
	
                        
                }       
              
}       
}


