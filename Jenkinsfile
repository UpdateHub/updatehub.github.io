node('docker') {
  def git_describe = null

  stage('Checkout') {
    sh 'git rev-parse > /dev/null 2>&1 && git clean -dxf || true'
    checkout scm
    sh "git describe --always > .git/git-describe"
    git_describe = readFile('.git/git-describe').trim()
    println git_describe
  }

  docker.withRegistry('https://docker-registry.ossystems.com.br/', 'ossbot-docker') {
    def app = null

    stage('Build') {
      sh 'git describe --always HEAD^ > .git/previous-git-describe || touch .git/previous-git-describe'
      previous_git_describe = readFile('.git/previous-git-describe').trim()

      pull_failed = false
      if(previous_git_describe?.trim()) {
        println 'Previous build image is: ' + previous_git_describe
        try {
          docker.image("docker-registry.ossystems.com.br/ossystems/updatehub/docs:${previous_git_describe}").pull()
        } catch (error) {
          pull_failed = true
        }
      } else {
        pull_failed = true
      }

      if(pull_failed) {
        println 'Unable to find previous build image - ignoring and building from scratch.'
      }

      app = docker.build "docker-registry.ossystems.com.br/ossystems/updatehub/docs:${git_describe}"
    }

    stage('Docker image publish') {
      app.push "${git_describe}"
    }
  }
}