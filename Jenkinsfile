pipeline{
    agent any
    stages{
        
        stage('test stage'){
           
           steps {
            sh '''
            echo surya > sample.txt
            cat sample.txt            
            '''
            }

        }

        stage('maven build package'){
            steps{
                sh '''
                    mvn clean package
                '''
            }
        }
    }

}
