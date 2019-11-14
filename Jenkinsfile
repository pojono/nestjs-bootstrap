node("master") {

  stage('checkout') {
      checkout scm
  }

  stage("build") {
    sh 'docker build -t nestjs-bootstrap:latest .'
  }

  stage("tag") {
    sh 'docker tag nestjs-bootstrap:latest pojono/nestjs-bootstrap:latest'
  }

  stage("push") {
    sh 'docker push pojono/nestjs-bootstrap:latest'
  }

}
