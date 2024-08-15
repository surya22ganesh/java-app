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
            }
            // steps{
            //     sh 
            // }

        }
    }
}
