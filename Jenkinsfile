node {
    def app
    timeout(20){
    deleteDir() // Clean the workspace
    stage('Checkout') {
        git branch: 'Jenkins',
            url: 'https://github.com/zsvs/ITEA_Stepanets.git'
    }

	stage('Build image') {
		sh '''
		docker build mynginx:${env.BUILD_ID} -f Dockerfile.nginx .
		'''
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
		  echo 'Push image'
		   if [$DOCKER_PUSH == "true"]; then
			 echo "Push image"
		     docker push mynginx:${env.BUILD_ID}
		   else
		     echo "No pushes"
		   fi
		  '''
	}
}
}