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
		docker build -t mynginx:${BUILD_ID} -f Dockerfile.nginx .
		'''
	}

	stage('Test image') {
       	  sh '''
       	  if ! docker inspect mynginx:${BUILD_ID} &> /dev/null; then
        	echo 'docker-image does not exist!'
            exit 1
       	  fi
       	  '''
	}

	stage('Run image') {
       	  sh '''
			 docker run mynginx:${BUILD_ID} -e MY_NAME=${MY_NAME} -p 44044:44044 --rm
       	  '''
	}

	stage('Push image') {
    	  echo 'Push image'
		  sh '''
		  echo 'Push image'
		   if [$DOCKER_PUSH == "true"]; then
			 echo "Push image"
		     docker push mynginx:${BUILD_ID}
		   else
		     echo "No pushes"
		   fi
		  '''
	}
}
}