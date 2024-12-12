pipeline {

    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Twitter Pipeline Started'
            }
        }
        stage('clean workspace')
        {
           steps {cleanWs deleteDirs: true}
        }
        // stage('git checkout/clone'){
        //     steps{
        //         git branch: 'mainmaster', changelog: false, poll: false, url: 'https://github.com/surya22ganesh/java-app.git'
        //     }
        // }
        // https://github.com/surya22ganesh/java-app/archive/refs/heads/mainmaster.zip
        stage('git checkout/clone'){
            steps{
                sh 'git clone --depth 1 https://github.com/surya22ganesh/java-app.git'
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
                    cd java-app
                    mvn clean compile
                    mvn clean install
                    ls -lart 
                '''
            }
        }
        stage('Dockerfile build'){
            steps {
                sh '''
                   sudo docker build -t twitterimg java-app/
                '''
            }
        }
      stage('docker container run') {
            steps {
                script {
                    try {
                        echo 'Starting Docker conatiner...'
                        sh 'sudo docker run -dit --name twittercontainer -p 3000:8080 twitterimg'
                    } catch (Exception e) {
                        echo 'catched the error ! Error: ' + e.toString()
                        sh 'sudo docker rm twittercontainer -f'
                        currentBuild.result = 'FAILURE'
                    // } finally {
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
