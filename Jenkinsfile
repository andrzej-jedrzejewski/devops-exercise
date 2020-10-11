node{

  git branch: "main", url: "https://github.com/andrzej-jedrzejewski/devops-exercise" 

  stage('Check docker-compose version') {
        sh "docker-compose -v"
  }

  stage ('Build') {
        sh 'docker-compose -f docker-compose.yml build'
    }
  
}