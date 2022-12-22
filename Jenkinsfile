pipeline {
    agent any
    tools{
        maven 'Maven'
    }

    environment {
        imageName = "img"
        registryCredentials = "nexus"
        registry = "ec2-18-224-31-21.us-east-2.compute.amazonaws.com:8085/"
        dockerImage = ''
    }    

    stages{
        stage('Build Maven'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/HimanshuKapoor328/jenkins-pipeline']]])
                sh 'mvn clean install -DskipTests=true'
            }
        }
        
        // Building Docker images
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build imageName
        }
      }
    }

    // Uploading Docker images into Nexus Registry
    stage('Uploading to Nexus') {
     steps{  
         script {
             docker.withRegistry( 'http://'+registry, registryCredentials ) {
             dockerImage.push('latest')
          }
        }
      }
    }



        // stage('Build docker image'){
        //     steps{
        //         script{
        //             sh ' sudo docker build . -t hk328/img1:latest'
        //         }
        //     }
        // }
        
        // stage('Push docker image'){
        //     steps{
        //         script{
        //             withCredentials([string(credentialsId: 'dockerPws', variable: 'dockerPws')]) {
        //                 sh ' sudo docker login -u hk328 -p ${dockerPws}'
        //             }
        //             // withCredentials([string(credentialsId: 'docker-pass', variable: 'docker-pass')]) {
        //             //     sh ' sudo docker login -u hk328 -p ${docker-pass}'
        //             // }
        //             // sh 'echo $dockerPws | sudo docker login -u hk328 --password-stdin'
        //             sh 'sudo docker push hk328/img1:latest'
        //         }
        //     }
        // }
        
    }
}