pipeline {
    agent any
    stages{
      
      stage('Checkout'){
            steps {
                git 'https://github.com/Magothen/Maria_Jacoco_test.git'
            }
        }
        stage('JUnit Build') {
            steps {
                sh "mvn compile"
            }
        }
        stage('JUnit Test') {
            steps {
                sh "mvn test"
            }
            post {
                always {
                    junit '**/TEST*.xml'
                }
            }
        }

        stage('Publish Test Coverage Report') {
                 steps {
                   step([$class: 'JacocoPublisher', 
                        execPattern: '**/build/jacoco/*.exec',
                        classPattern: '**/build/classes',
                        sourcePattern: 'src/main/java',
                        exclusionPattern: 'src/test*'
                        ])
                    }
                }
    }
}
