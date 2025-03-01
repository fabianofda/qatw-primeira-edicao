pipeline {
    agent {
        docker {
            image 'fabianof2da/playwright-nj-v1.50.1-noble'
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
                // Verificar e configurar JAVA_HOME
                sh '''
                if [ -d "/usr/lib/jvm/java-21-openjdk-amd64" ]; then
                    export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
                    export PATH=$JAVA_HOME/bin:$PATH
                else
                    echo "Diretório do JAVA_HOME inválido!"
                    exit 1
                fi
                npx playwright test
                '''
                allure includeProperties: false, jdk: '', results: [[path: 'allure-results']]
            }
        }
    }
}
