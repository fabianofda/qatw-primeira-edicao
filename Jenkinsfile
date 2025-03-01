pipeline {
    agent {
        docker {
            image 'fabianof2da/playwright-nj-v1.50.1-noble:latest'
            args '--network qatw-primeira-edicao_skynet'
        }
    }

    stages {
        stage('Node.js Deps') {
            steps {
                sh 'npm install'
            }
        }
        stage('E2E Tests') {
            steps {
                sh '''
                echo "JAVA_HOME: $JAVA_HOME"
                echo "PATH: $PATH"
                npx playwright test
                '''
                allure includeProperties: false, jdk: '', results: [[path: 'allure-results']]
            }
        }
    }
}
