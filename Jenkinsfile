node("master") {

  stage('checkout') {
      checkout scm
  }

  stage("build") {
    sh 'docker build -t nestjs-bootstrap .'
  }

}
