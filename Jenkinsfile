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
        
        
        
        stage('newman') {
            steps {
                sh 'newman run MT20_MARIA_SHISHKINA_Restful_Booker.postman_collection.json --environment MT20_MARIA_SHISHKINA_Restful_Booker.postman_environment.json --reporters junit'
            }
            post {
                always {
                        junit '**/*xml'
                    }
                }
        }
        
        
        stage('Robot Framework System tests with Selenium') {
            steps {
                sh 'robot --variable BROWSER:headlesschrome -d Results  Tests'
            }
            post {
                always {
                    script {
                          step(
                                [
                                  $class              : 'RobotPublisher',
                                  outputPath          : 'Results',
                                  outputFileName      : '**/output.xml',
                                  reportFileName      : '**/report.html',
                                  logFileName         : '**/log.html',
                                  disableArchiveOutput: false,
                                  passThreshold       : 50,
                                  unstableThreshold   : 40,
                                  otherFiles          : "**/*.png,**/*.jpg",
                                ]
                          )
                    }
                }
            }
        }
        
        

        stage('Publish Test Coverage Report with Jacoco') {
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
