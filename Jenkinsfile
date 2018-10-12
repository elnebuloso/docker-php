pipeline {
    agent any

	stages {
        stage('build php 5.6') {
            steps {
                script {
                    php = "5.6"

                    image = docker.build("elnebuloso/php:${php}-apache", "--build-arg PHP_VERSION=${php} --pull --rm --no-cache -f Dockerfile.apache .")
                    image.inside() {
                        php_version = sh(script: "php --version | grep -Po '^PHP (\\d+\\.)+\\d+' | sed 's!PHP !!g'", returnStdout: true).trim()
                    }

                    semver = semver(php_version)

                    docker.withRegistry("https://registry.hub.docker.com", '061d45cc-bc11-4490-ac21-3b2276f1dd05'){
                        image.push("${semver.get('tag_revision')}-apache")
                        image.push("${semver.get('tag_minor')}-apache")
                    }
                }

                script {
                    php = "5.6"

                    image = docker.build("elnebuloso/php:${php}-cli", "--build-arg PHP_VERSION=${php} --pull --rm --no-cache -f Dockerfile.cli .")
                    image.inside() {
                        php_version = sh(script: "php --version | grep -Po '^PHP (\\d+\\.)+\\d+' | sed 's!PHP !!g'", returnStdout: true).trim()
                    }

                    semver = semver(php_version)

                    docker.withRegistry("https://registry.hub.docker.com", '061d45cc-bc11-4490-ac21-3b2276f1dd05'){
                        image.push("${semver.get('tag_revision')}-cli")
                        image.push("${semver.get('tag_minor')}-cli")
                    }
                }
            }
        }

        stage('build php 7.0') {
            steps {
                script {
                    php = "7.0"

                    image = docker.build("elnebuloso/php:${php}-apache", "--build-arg PHP_VERSION=${php} --pull --rm --no-cache -f Dockerfile.apache .")
                    image.inside() {
                        php_version = sh(script: "php --version | grep -Po '^PHP (\\d+\\.)+\\d+' | sed 's!PHP !!g'", returnStdout: true).trim()
                    }

                    semver = semver(php_version)

                    docker.withRegistry("https://registry.hub.docker.com", '061d45cc-bc11-4490-ac21-3b2276f1dd05'){
                        image.push("${semver.get('tag_revision')}-apache")
                        image.push("${semver.get('tag_minor')}-apache")
                    }
                }

                script {
                    php = "7.0"

                    image = docker.build("elnebuloso/php:${php}-cli", "--build-arg PHP_VERSION=${php} --pull --rm --no-cache -f Dockerfile.cli .")
                    image.inside() {
                        php_version = sh(script: "php --version | grep -Po '^PHP (\\d+\\.)+\\d+' | sed 's!PHP !!g'", returnStdout: true).trim()
                    }

                    semver = semver(php_version)

                    docker.withRegistry("https://registry.hub.docker.com", '061d45cc-bc11-4490-ac21-3b2276f1dd05'){
                        image.push("${semver.get('tag_revision')}-cli")
                        image.push("${semver.get('tag_minor')}-cli")
                    }
                }
            }
        }

        stage('build php 7.1') {
            steps {
                script {
                    php = "7.1"

                    image = docker.build("elnebuloso/php:${php}-apache", "--build-arg PHP_VERSION=${php} --pull --rm --no-cache -f Dockerfile.apache .")
                    image.inside() {
                        php_version = sh(script: "php --version | grep -Po '^PHP (\\d+\\.)+\\d+' | sed 's!PHP !!g'", returnStdout: true).trim()
                    }

                    semver = semver(php_version)

                    docker.withRegistry("https://registry.hub.docker.com", '061d45cc-bc11-4490-ac21-3b2276f1dd05'){
                        image.push("${semver.get('tag_revision')}-apache")
                        image.push("${semver.get('tag_minor')}-apache")
                    }
                }

                script {
                    php = "7.1"

                    image = docker.build("elnebuloso/php:${php}-cli", "--build-arg PHP_VERSION=${php} --pull --rm --no-cache -f Dockerfile.cli .")
                    image.inside() {
                        php_version = sh(script: "php --version | grep -Po '^PHP (\\d+\\.)+\\d+' | sed 's!PHP !!g'", returnStdout: true).trim()
                    }

                    semver = semver(php_version)

                    docker.withRegistry("https://registry.hub.docker.com", '061d45cc-bc11-4490-ac21-3b2276f1dd05'){
                        image.push("${semver.get('tag_revision')}-cli")
                        image.push("${semver.get('tag_minor')}-cli")
                    }
                }
            }
        }

        stage('build php 7.2') {
            steps {
                script {
                    php = "7.2"

                    image = docker.build("elnebuloso/php:${php}-apache", "--build-arg PHP_VERSION=${php} --pull --rm --no-cache -f Dockerfile.apache .")
                    image.inside() {
                        php_version = sh(script: "php --version | grep -Po '^PHP (\\d+\\.)+\\d+' | sed 's!PHP !!g'", returnStdout: true).trim()
                    }

                    semver = semver(php_version)

                    docker.withRegistry("https://registry.hub.docker.com", '061d45cc-bc11-4490-ac21-3b2276f1dd05'){
                        image.push("${semver.get('tag_revision')}-apache")
                        image.push("${semver.get('tag_minor')}-apache")
                    }
                }

                script {
                    php = "7.2"

                    image = docker.build("elnebuloso/php:${php}-cli", "--build-arg PHP_VERSION=${php} --pull --rm --no-cache -f Dockerfile.cli .")
                    image.inside() {
                        php_version = sh(script: "php --version | grep -Po '^PHP (\\d+\\.)+\\d+' | sed 's!PHP !!g'", returnStdout: true).trim()
                    }

                    semver = semver(php_version)

                    docker.withRegistry("https://registry.hub.docker.com", '061d45cc-bc11-4490-ac21-3b2276f1dd05'){
                        image.push("${semver.get('tag_revision')}-cli")
                        image.push("${semver.get('tag_minor')}-cli")
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
    def parser = /(?<major>\d+).(?<minor>\d+).(?<revision>\d+)/
    def match = (version =~ parser)

    if(match.matches()) {
        def major = match[0][1]
        def minor = match[0][2]
        def revision = match[0][3]

        def tag_major = "${major}"
        def tag_minor = "${major}.${minor}"
        def tag_revision = "${major}.${minor}.${revision}"

        match = null

        def map = [tag_major: tag_major, tag_minor: tag_minor, tag_revision: tag_revision]

        return map
    }
}