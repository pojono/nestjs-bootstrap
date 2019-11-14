pipeline {
  environment {
    registry = "pojono/nestjs-bootstrap"
    dockerImage = ''
  }
  node("master") {
    stage('checkout') {
        checkout scm
    }

    stage("build") {
      dockerImage = docker.build registry + ":$BUILD_NUMBER"
    }

    stage("push") {
      dockerImage.push()
    }
  }
}
