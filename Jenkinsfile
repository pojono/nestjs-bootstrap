try {
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

    stage("telegram") {
      telegramSend "#jenkins ${env.JOB_NAME}: Build Success #${env.BUILD_NUMBER} ${env.JOB_URL} "
    }
  }

} catch (err) {
  telegramSend "#jenkins ${env.JOB_NAME}: Build Failed #${env.BUILD_NUMBER} ${env.JOB_URL} "
  throw err
}
