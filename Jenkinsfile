  node("master") {
    stage('checkout') {
        checkout scm
    }

    stage("build") {
      dockerImage = docker.build "pojono/nestjs-bootstrap" + ":$BUILD_NUMBER"
    }

    stage("push") {
      withDockerRegistry([ credentialsId: "DockerRegistry", url: "" ]) {
        dockerImage.push()
      }
    }
  }
