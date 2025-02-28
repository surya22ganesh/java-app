pipeline {

    agent any

    // environment {
    //     DOCKER_REGISTRY = '535002850717.dkr.ecr.us-east-2.amazonaws.com'  // Replace with your Docker registry (e.g., 'docker.io/username')
    //     IMAGE_NAME = 'twitter'
    //     // GITHUB_PAT =  credentials('github_PAT')
    // }

    stages {

        stage('clean workspace/directory')
        {
           steps {cleanWs deleteDirs: true}
        }

        stage('git checkout/clone'){
            steps{
                git branch: 'main', changelog: false, poll: false, url: 'https://github.com/surya22ganesh/java-app.git'
            }
        }

        stage('trivy remote/git repository scan'){
            steps{
                sh 'trivy repository https://github.com/surya22ganesh/java-app.git -o trivy-reports/trivy_repo.txt'
            }
        }

        stage('trivy directory/filesystem scan'){
            steps{
                sh 'trivy fs . -o trivy-reports/trivyfs.txt'
            }
        }

        // stage("sonarqube"){
        //     steps {
        //         withSonarQubeEnv(credentialsId: 'sonarqubetoken',installationName: 'sonarscanner') {
        //         sh '''
        //                 mvn clean package
        //                 mvn sonar:sonar \
        //                     -Dsonar.projectName=twitterapp \
        //                     -Dsonar.projectKey=twitterapp \
        //                     -Dsonar.host.url=http://3.137.175.64:9000
        //             '''
        //         }
        //     }
        // }

        stage('build maven JAR package'){
            steps{
                sh ''' 
                    mvn clean compile
                    mvn clean install
                    ls -lart 
                '''
            }
        }

        // stage('Dockerfile build'){
        //     steps {
        //         sh "sudo docker build -t ${DOCKER_REGISTRY}/${IMAGE_NAME}:${env.BUILD_NUMBER} ."
        //     }
        // }

        // stage('Docker Image Push'){
        //     steps {
        //         sh "sudo docker push ${DOCKER_REGISTRY}/${IMAGE_NAME}:${env.BUILD_NUMBER}"
        //     }
        // }

        // stage('Docker Image Pull'){
        //     steps{
        //         sh "sudo docker pull ${DOCKER_REGISTRY}/${IMAGE_NAME}:${env.BUILD_NUMBER}"
        //     }
        // }

        // stage('docker container run') {
            
        //     steps {

        //         script {
        //                 try {
        //                     echo 'Starting Docker container...'
        //                     sh "sudo docker run -dit --name twittercontainer -p 3000:8080 ${DOCKER_REGISTRY}/${IMAGE_NAME}:${env.BUILD_NUMBER}"
        //                 } 
        //                 catch (Exception e) {
        //                     echo 'catched the error ! Error: ' + e.toString()
        //                     sh 'sudo docker rm twittercontainer -f'
        //                     sh "sudo docker run -dit --name twittercontainer -p 3000:8080 ${DOCKER_REGISTRY}/${IMAGE_NAME}:${env.BUILD_NUMBER}"
        //                 }

        //             }
        //     }

        // }

    }
}
