pipeline {
    agent any

    stages {
        stage('maven build') {
            steps {
                sh mvn clean package
            }
        }
    }
}
