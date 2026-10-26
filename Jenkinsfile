pipeline {
    agent any

    parameters {
        choice(
            name: 'PLATFORM',
            choices: ['linux', 'android', 'qnx'],
            description: '选择目标平台'
        )
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Building platform: ${params.PLATFORM}"
            }
        }

        stage('Build') {
            steps {
                echo 'Start build...'
            }
        }
    }
}