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
        stage('ssh agent tomcat added')
        {
            steps{
                sshagent(['a8da2af2-c34e-40e9-a620-a82c99dc7291']) {
                   // some block
                   sh '''
                        ssh ubuntu@3.144.250.111 -o StrictHostKeyChecking=no 
                        ssh ubuntu@3.144.250.111 echo tomcat agent added 
                  '''
                }
            }
        }
    }
}
