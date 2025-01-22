pipeline {

    agent any

    environment {
        DOCKER_REGISTRY = '535002850717.dkr.ecr.us-east-2.amazonaws.com'  // Replace with your Docker registry (e.g., 'docker.io/username')
        IMAGE_NAME = 'twitter'
    }

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

        // stage('trivy remote/git repository scan'){
        //     steps{
        //         sh 'trivy repository https://github.com/surya22ganesh/java-app.git > trivy-reports/trivy_repo.txt'
        //     }
        // }

        // stage('trivy directory/filesystem scan'){
        //     steps{
        //         sh 'trivy fs . > trivy-reports/trivyfs.txt'
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

        stage("sonarqube"){
            steps {
                withSonarQubeEnv(credentialsId: 'sonarqubetoken') {
                    // some block
                    sh '''
                        mvn clean verify sonar:sonar \
                        -Dsonar.projectKey=app1 \
                        -Dsonar.host.url=http://3.138.119.80:9000 \
                        -Dsonar.login=squ_218d8b3a1c6e10253924dc909a64658a831e5b1f
                    '''
                }
            }
        }
        // stage("Sonarqube analysis"){
        //     steps{
        //         // sh 'sudo sh /opt/sonarscanner/sonarscanner/bin -Dsonar.projectKey=javaapp -Dsonar.sources=/var/lib/jenkins/workspace/twitter_pipeline -Dsonar.host.url=http://18.222.101.61/:9000 -Dsonar.token=squ_a4b7eef853cdeb14935018dc4dc8fa8c63dd2131'
        //         sh '''
        //         mvn clean verify sonar:sonar \
        //             -Dsonar.projectKey=javaapp \
        //             -Dsonar.projectName='javaapp' \
        //             -Dsonar.host.url=http://18.222.101.61:9000 \
        //             -Dsonar.token=sqp_040004762ddd335870db5db8feeda4dee7de8fcb
        //         '''
        //     }
        // }

        // stage('Dockerfile build'){
        //     steps {
        //         // sh "sudo docker build -t ${DOCKER_REGISTRY}/${IMAGE_NAME}:${imageTag} ."
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
        //         script{
        //                 try {
        //                     echo 'Starting Docker container...'
        //                     sh "sudo docker run -dit --name twittercontainer -p 3000:8080 ${DOCKER_REGISTRY}/${IMAGE_NAME}:${env.BUILD_NUMBER}"
        //                 } 
        //                 catch (Exception e) {
        //                     echo 'catched the error ! Error: ' + e.toString()
        //                     sh 'sudo docker rm twittercontainer -f'
        //                     sh "sudo docker run -dit --name twittercontainer -p 3000:8080 ${DOCKER_REGISTRY}/${IMAGE_NAME}:${env.BUILD_NUMBER}"
        //                     // currentBuild.result = 'FAILURE' 
        //                 }
        //                   // finally {
        //                   //     echo 'Cleaning up...'
        //                   //     sh 'sudo docker run -dit --name twittercontainer -p 3000:8080 twitterimg'
        //                   // }
        //                 }
        //     }

        // }

    }
}
