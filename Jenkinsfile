@NonCPS
def sendChangeLogs() {
    def commitMessages = ""
    def formatter = new SimpleDateFormat('yyyy-MM-dd HH:mm')
    def changeLogSets = currentBuild.changeSets
    for (int i = 0; i < changeLogSets.size(); i++) {
        def entries = changeLogSets[i].items
        for (int j = 0; j < entries.length; j++) {
            def entry = entries[j]
            commitMessages = commitMessages + "${entry.author} ${entry.commitId}:\n${formatter.format(new Date(entry.timestamp))}: *${entry.msg}*\n"
        }
    }
    telegramSend "✅ #jenkins ${env.JOB_NAME}: Build Success #${env.BUILD_NUMBER} ${env.JOB_URL} Changes: ${commitMessages}"
}

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
      sendChangeLogs()
    }
  }

} catch (err) {
  telegramSend "⚠ #jenkins ${env.JOB_NAME}: Build Failed #${env.BUILD_NUMBER} ${env.JOB_URL} "
  throw err
}
