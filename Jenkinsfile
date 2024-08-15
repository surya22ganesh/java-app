pipeline {
    agent any

    stages {
        // stage('maven build') {
        //     steps {
        //         sh "mvn clean package"
        //     }
        // }
        stage('test stage'){
            steps{
                sh "echo surya"    
            }
        }
        stage('maven build'){

            steps{
                sh "mvn clean package"
                sh "mv target/*.war target/myweb.war"
            }
        }
    }
}
