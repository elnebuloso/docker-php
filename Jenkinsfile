pipeline {
    agent any

    parameters {
        choice(choices: '5.6\n7.0\n7.1\n7.2\n7.3', description: 'Select the PHP version to build', name: 'php')
        choice(choices: 'apache\ncli', description: 'Select the container type', name: 'type')
    }

	stages {
        stage('build') {
            steps {
                script {
                    image = docker.build("elnebuloso/php:${php}-${type}", "--build-arg PHP_VERSION=${php} --pull --rm --no-cache -f Dockerfile.${type} .")
                    image.inside() {
                        php_version = sh(script: "php --version | grep -Po '^PHP (\\d+\\.)+\\d+' | sed 's!PHP !!g'", returnStdout: true).trim()
                    }

                    sh "docker run -i --rm -v /var/run/docker.sock:/var/run/docker.sock -v ${pwd}:/app zemanlx/container-structure-test:v1.7.0-alpine test --image elnebuloso/php:${php}-${type} --config /app/tests/structure.yaml"
                    sh "docker run -i --rm -v /var/run/docker.sock:/var/run/docker.sock -v ${pwd}:/app zemanlx/container-structure-test:v1.7.0-alpine test --image elnebuloso/php:${php}-${type} --config /app/tests/structure-${type}.yaml"

                    semver = semver(php_version)

                    docker.withRegistry("https://registry.hub.docker.com", '061d45cc-bc11-4490-ac21-3b2276f1dd05'){
                        image.push("${semver.get('tag_patch')}-${type}")
                        image.push("${semver.get('tag_minor')}-${type}")
                    }
                }
            }
        }
	}

	post {
	    always {
            cleanWs()
	    }
	}
}

/**
 * @var string version
 * @return map
 */
def semver(version) {
    def parser = /(?<major>\d+).(?<minor>\d+).(?<patch>\d+)/
    def match = (version =~ parser)

    if(match.matches()) {
        def major = match[0][1]
        def minor = match[0][2]
        def patch = match[0][3]

        def tag_major = "${major}"
        def tag_minor = "${major}.${minor}"
        def tag_patch = "${major}.${minor}.${patch}"

        match = null

        def map = [tag_major: tag_major, tag_minor: tag_minor, tag_patch: tag_patch]

        return map
    }
}
