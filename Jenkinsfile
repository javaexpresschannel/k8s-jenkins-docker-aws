pipeline {
   agent any 
   tools {
        maven "MAVEN"
     
    }

    stage("Git Clone"){

        git 'https://github.com/javaexpresschannel/k8s-jenkins-docker-aws.git'
    }

     stage('Maven Build') {

       sh 'mvn clean package'

    }

    stage("Docker build"){
        sh 'docker version'
        sh 'docker build -t springboot-docker-demo .'
        sh 'docker image list'
        sh 'docker tag springboot-docker-demo javaexpress/springboot-docker-demo:latest'
    }

    withCredentials([string(credentialsId: 'DOCKER_HUB_PASSWORD', variable: 'PASSWORD')]) {
        sh 'docker login -u javaexpress -p $PASSWORD'
    }

    stage("Push Image to Docker Hub"){
        sh 'docker push  javaexpress/springboot-docker-demo:latest'
    }
    
    stage("kubernetes deployment"){
        sh 'kubectl apply -f k8s-spring-boot-deployment.yml'
    }
} 
