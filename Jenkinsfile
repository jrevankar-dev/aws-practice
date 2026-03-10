pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'staging', url: 'https://github.com/jrevankar-dev/aws-practice.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                python3 -m venv venv
                source venv/bin/activate
                pip install -r requirements.txt
                '''
            }
        }

        stage('Run Robot Tests') {
            steps {
                sh '''
                source venv/bin/activate
                robot -d results tests/
                '''
            }
        }

        stage('Archive Results') {
            steps {
                archiveArtifacts artifacts: 'results/**', fingerprint: true
            }
        }
    }

    post {
        success {
            echo "Pipeline executed successfully"
        }
        failure {
            echo "Pipeline failed"
        }
    }
}
