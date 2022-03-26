pipeline {
    agent { label 'SlaveNode' }
      stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
                sh '''
                    echo clientid - ${SB_CLIENTID}
                    echo username - ${SB_USERNAME}
                    echo instanceurl - ${SB_URL}
                '''
            }
        }
        stage('authenitcating') {    
            steps{
                withCredentials([file(credentialsId: 'SERVER_KEY', variable: 'SERVER_KEY')]) {
                    sh '''
                    ${toolbelt}/sfdx auth:jwt:grant --clientid ${SB_CLIENTID} --jwtkeyfile ${SERVER_KEY} --username ${SB_USERNAME} --instanceurl ${SB_URL} --setalias devorg
                    '''
                }   
            }

        }
    }     
}  
