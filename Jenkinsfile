pipeline {
    environment {
        REGISTRY_CREDENTIALS = credentials('061d45cc-bc11-4490-ac21-3b2276f1dd05')
        REGISTRY_USERNAME = "${REGISTRY_CREDENTIALS_USR}"
        REGISTRY_PASSWORD = "${REGISTRY_CREDENTIALS_PSW}"
    }

    agent {
        docker {
            image 'elnebuloso/phing'
            args '--volume /var/run/docker.sock:/var/run/docker.sock --env-file $WORKSPACE/build.env'
            reuseNode false
            alwaysPull true
        }
    }

	stages {
        stage('build') {
            steps {
                sh "docker-login --username ${REGISTRY_CREDENTIALS_USR} --password ${REGISTRY_CREDENTIALS_PSW}"
            }
        }
	}

	post {
	    always {
            cleanWs()
	    }
	}
}
