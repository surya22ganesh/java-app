pipeline {

    agent any

    stages {
        // stage('clean workspace')
        // {
        //    steps {cleanWs deleteDirs: true}
        // }
        stage('git checkout/clone'){
            steps{
                git branch: 'main', changelog: false, poll: false, url: 'https://github.com/surya22ganesh/java-app.git'
            }
        }
        stage('Environment Info') {
            steps {
                echo "Building ${env.JOB_NAME} #${env.BUILD_NUMBER}"
                echo "Workspace: ${env.WORKSPACE}"
            }
        }
        stage('trivy repository scan'){
            steps{
                sh 'trivy repository . > trivy_repo.txt'
            }
        }
        stage('trivy filesystem scan'){
            steps{
                sh 'trivy fs . > trivyfs.txt'
            }
        }
        stage('build maven JAR package'){
            steps{
                sh ''' 
                    mvn clean compile
                    mvn clean install
                    ls -lart 
                '''
            }
        }
        stage('Dockerfile build'){
            steps {
                sh '''
                   sudo docker build -t twitter .
                '''
            }
        }
        stage('Docker Image Push'){
            steps {
                sh '''
                   sudo docker tag twitter 535002850717.dkr.ecr.us-east-2.amazonaws.com/twitter
                   sudo docker push 535002850717.dkr.ecr.us-east-2.amazonaws.com/twitter
                '''
            }
        }
        stage('docker container run') {
              steps {
                  script {
                      try {
                          echo 'Starting Docker conatiner...'
                          sh 'sudo docker run -dit --name twittercontainer -p 3000:8080 twitter'
                      } catch (Exception e) {
                          echo 'catched the error ! Error: ' + e.toString()
                          sh 'sudo docker rm twittercontainer -f'
                          sh 'sudo docker run -dit --name twittercontainer -p 3000:8080 twitter'
                          // currentBuild.result = 'FAILURE' 
                      } 
                      // finally {
                      //     echo 'Cleaning up...'
                      //     sh 'sudo docker run -dit --name twittercontainer -p 3000:8080 twitterimg'

                      // }
                  }
              }

          }
        //
        // stage('run JAR'){
        //     steps {
        //         sh '''
        //             cd target
        //             java -jar twitter-1.0.jar
        //         '''
        //     }
        // }
        // stage('zip war package'){
        //     steps{
        //         sh ''' 

        //         '''
        //     }
        // }
        // stage('push updated WAR package'){
        //     steps {
        //         sh '''
        //             git status
        //             git add target/twitter-1.0.war
        //             git commit -m "new war package"
        //             git push origin main
        //             git status
        //         '''
        //     }
        // }
        ////
        // stage(){
        //     steps {
        //         sh '''
        //             // mv surya-artifact-1.0.war twitter.war
        //         '''
        //     }    
        // }
    }
}
