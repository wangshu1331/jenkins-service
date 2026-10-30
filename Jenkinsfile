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
        choice(
            name: 'BUILD_MODE',
            choices: ['latest', 'build_with_tag'],
            // defaultValue: 'build_with_tag',
            description: '构建模式'
        )
        booleanParam(
            name: 'IS_TEST',
            defaultValue: false,
            description: '是否测试'
        )
        choice(
            name: 'TAG',
            choices: param('https://github.com/gabime/spdlog.git'),
            description: '选择要构建的 tag'
        )
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Building platform: ${params.PLATFORM}"
                echo "Is push: ${params.IS_PUSH}"
                echo "workspace is:${WORKSPACE}"
                // sshAgent(['pwm_github_ssh']) {
                sh './scripts/clone.sh'
                // }
            }
        }

        stage('Build') {
            steps {
                echo 'Start build...'
                sh './scripts/build.sh'
            }
        }
        stage('Test') {
            steps {
                echo 'Start test...'
            }
        }
        stage("FINSHED") {
            steps {
                post {
                    always{ cleanWs()  } 
                }   
            }

        }
        
    }
}