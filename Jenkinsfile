pipeline {
    agent { label 'SlaveNode' }
          environment {
    toolbet = tool name: 'toolbelt', type: 'com.cloudbees.jenkins.plugins.customtools.CustomTool'
}   
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
                    echo $PATH
                    pwd
                    sfdx --version
                    echo ${toolbelt}/sfdx
                    ${toolbelt}/sfdx auth:jwt:grant --clientid ${SB_CLIENTID} --jwtkeyfile ${SERVER_KEY} --username ${SB_USERNAME} --instanceurl ${SB_URL} --setalias devorg
                    '''
                }   
            }

        }
    }     
}  
