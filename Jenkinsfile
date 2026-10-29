// 需要在 Jenkins 全局配置里注册名为 jenkins-service 的共享库，并勾选 Trusted
@Library('jenkins-service') _

pipeline {
    agent any

    parameters {
        choice(
            name: 'PLATFORM',
            choices: ['linux', 'android', 'qnx'],
            description: '选择目标平台'
        )
        booleanParam(
            name: 'IS_PUSH',
            defaultValue: false,
            description: '是否推送镜像'
        )
        choice(
            name: 'TAG',
            choices: param('git@github.com:wangshu1331/jenkins-service.git'),
            description: '选择要构建的 tag'
        )
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Building platform: ${params.PLATFORM}"
                echo "Is push: ${params.IS_PUSH}"
            }
        }

        stage('Build') {
            steps {
                echo 'Start build...'
            }
        }
        stage('Test') {
            steps {
                echo 'Start test...'
            }
        }
    }
}