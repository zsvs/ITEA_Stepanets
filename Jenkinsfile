node {
    def app
    timeout(20){
    deleteDir() // Clean the workspace
    stage('Checkout') {
        git branch: 'Jenkins',
            url: 'https://github.com/zsvs/ITEA_Stepanets.git'
    }

	stage('Build image') {
    	  app = docker.build("mynginx:${env.BUILD_ID}", "-e MY_NAME=${MY_NAME}", "-f Dockerfile.nginx .")
	}

	stage('Test image') {
       	  sh '''
       	  if ! docker inspect mynginx:${env.BUILD_ID} &> /dev/null; then
            echo 'docker-image does not exist!'
            exit 1
       	  fi
       	  '''
	}

	stage('Push image') {
    	  echo 'Push image'
		  sh '''
		   if [$DOCKER_PUSH == "false"]; then
		    exit 1
		  '''
          app.push("${env.BUILD_NUMBER}")
          app.push("latest")
	}

	stage('Clean existing image') {
  	  sh "docker rmi mynginx"
	}
}
}