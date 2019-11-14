  node("master") {
    stage('checkout') {
        checkout scm
    }

    stage("build") {
      dockerImage = docker.build "pojono/nestjs-bootstrap" + ":$BUILD_NUMBER"
    }

    stage("push") {
      docker.withRegistry('docker.io', 'DockerRegistry') {
        dockerImage.push()
      }
    }
  }
