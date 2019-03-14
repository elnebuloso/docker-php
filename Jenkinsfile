pipeline {
    environment {
        REGISTRY_CREDENTIALS = credentials('061d45cc-bc11-4490-ac21-3b2276f1dd05')
    }

    agent {
        docker {
            image 'elnebuloso/phing'
            args '--user 1000 --volume /var/run/docker.sock:/var/run/docker.sock --env-file $WORKSPACE/build.env'
            reuseNode false
            alwaysPull true
        }
    }

	stages {
        stage('build') {
            steps {
                sh "docker login --username ${REGISTRY_CREDENTIALS_USR} --password ${REGISTRY_CREDENTIALS_PSW}"
                sh "phing run:7.1-cli -Dcommand=push"
                sh "phing run:7.1-cli-ubuntu -Dcommand=push"
            }
        }
	}

	post {
	    always {
            cleanWs()
	    }
	}
}
