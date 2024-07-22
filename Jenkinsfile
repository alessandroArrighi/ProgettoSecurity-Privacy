pipeline {
    agent any

    stages {
        stage('Build con Sonar') {
            steps {
                withSonarQubeEnv('sonarqube') {
                    script {
                        docker.image('maven').inside("--network pipeline") {
                            sh "mvn clean verify sonar:sonar -Dsonar.projectKey=sonarqube -Dsonar.projectName='sonarqube'"
                        }
                    }
                }
            }
        }
        stage("Quality Gate") {
            steps {
                waitForQualityGate abortPipeline: true
            }
        }
        stage('dependencyTrackPublisher') {
            steps {
                withCredentials([string(credentialsId: 'dt-key', variable: 'API_KEY')]) {
                    dependencyTrackPublisher autoCreateProjects: true, artifact: './target/bom.json', projectName: 'pipeline', projectVersion: '1.0.0', synchronous: true, dependencyTrackApiKey: API_KEY
                }
            }
        }
    }
    post {
        success {
            archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            sh 'git config --global user.email "Jenkins"'
            sh 'git config --global user.name "Jenkins"'
            sh 'git checkout main'
            sh 'git config pull.rebase true'
            sh 'git pull'
            sh 'git merge --strategy-option=theirs origin/dev'
            
            withCredentials([gitUsernamePassword(credentialsId: 'github-token', gitToolName: 'Default')]) {
                sh 'git push --set-upstream origin main'
            }

            emailext(
                    subject: "Pipeline Success",
                    mimeType: 'text/html',
                    to: "alessandro.arrighi2@studio.unibo.it",
                    body: "The pipeline is finished successfully"
            )
        }
        failure {
            emailext(
                    subject: "Pipeline Failed",
                    mimeType: 'text/html',
                    to: "alessandro.arrighi2@studio.unibo.it",
                    body: "The pipeline is failed"
            )
        }
    }
}