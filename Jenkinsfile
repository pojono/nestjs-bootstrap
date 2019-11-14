node("master") {

  environment {
    registry = "pojono/nestjs-bootstrap"
    dockerImage = ''
  }

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
