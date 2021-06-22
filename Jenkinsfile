node {
    def app
    timeout(20){
    deleteDir() // Clean the workspace
    stage('Checkout') {
        git branch: 'main',
            url: 'https://github.com/Dgadavin/itea-base-course.git'
    }

	stage('Build image') {
    	  app = docker.build("docker-image")
	}

	stage('Test image') {
       	  sh '''
       	  if ! docker inspect docker-image &> /dev/null; then
            echo 'docker-image does not exist!'
            exit 1
       	  fi
       	  '''
	}

	stage('Push image') {
    	  echo 'Push image'
    	  docker.withRegistry('https://local-registry:9666', 'registry-creds') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
    	  }
	}

	stage('Clean existing image') {
  	  sh "docker rmi docker-image"
	}
}
}