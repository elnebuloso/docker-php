pipeline {
    environment {
        REGISTRY_CREDENTIALS = credentials('061d45cc-bc11-4490-ac21-3b2276f1dd05')
    }

    parameters {
        choice(choices: '7.1-apache\n7.1-cli\n7.2-apache\n7.2-cli\n7.3-apache\n7.3-cli\n7.1-apache-ubuntu\n7.1-cli-ubuntu\n7.2-apache-ubuntu\n7.2-cli-ubuntu\n7.3-apache-ubuntu\n7.3-cli-ubuntu', description: 'select the php version to build', name: 'selected')
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
                sh "phing run:${selected} -Dcommand=push"
            }
        }
	}

	post {
	    always {
            cleanWs()
	    }
	}
}
