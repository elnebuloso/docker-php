node {
    stage('checkout') {
        checkout scm
    }

    stage('build php 5.6') {
        def image = docker.build("elnebuloso/php:5.6", "--build-arg PHP_VERSION=5.6 --pull --rm -f Dockerfile .")

        image.inside() {
            php_version = sh(script: "php --version | grep -Po "^PHP (\\d+\\.)+\\d+" | sed 's!PHP !!g'", returnStdout: true).trim()
        }

        docker.withRegistry("https://registry.hub.docker.com", '061d45cc-bc11-4490-ac21-3b2276f1dd05'){
            image.push()
            image.tag(php_version)
            image.push(php_version)
        }
    }
}