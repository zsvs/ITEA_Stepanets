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
		sudo docker build -t mynginx:${BUILD_ID} -f Dockerfile.nginx .
		'''
	}

	stage('Run image') {
       	  sh '''
			sudo docker run mynginx:${BUILD_ID} -e MY_NAME=${MY_NAME} -p 44044:44044 --rm
       	  '''
	}

	stage('Push image') {
    	  echo 'Push image'
		  sh '''
		  echo 'Push image'
		   if [$DOCKER_PUSH == "true"]; then
			 echo "Push image"
		     sudo docker push mynginx:${BUILD_ID}
		   else
		     echo "Image not pushed to DockerHub"
		   fi
		  '''
	}
}
}