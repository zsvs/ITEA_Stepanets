pipelineJob("docker-nginx-test") {
    	logRotator {
            numToKeep(10)
    	}

    parameters {
      stringParam('MY_NAME', 'default', 'Set environment variable')
	booleanParam('DOCKER_PUSH', true, 'Push to docker hub')
    }

    definition {
        cpsScm {
   	      scm {
                  git {
                        remote {
                              github("zsvs/ITEA_Stepanets", 'https')
                              branch("Jenkins")
                              }
                        }
                  }
        scriptPath("Jenkinsfile")
      }

    }

 }
