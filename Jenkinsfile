pipeline {
    agent { label 'AWSNODE' }

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
            steps {
//                withCredentials([usernamePassword(credentialsId: 'b3acfe60-dfa8-4a45-9685-921569451360', passwordVariable: 'sbpassword', usernameVariable: 'sbusername')]) {
                // some block
withCredentials([file(credentialsId: '34618e1e-5d36-4189-8e27-0e7273bd7919', variable: 'SERVER_KEY')]) {
                sh '''
                sfdx auth:jwt:grant --clientid ${SB_CLIENTID} --jwtkeyfile ${SERVER_KEY} --username ${SB_USERNAME} --instanceurl ${SB_URL} --setalias devorg
                '''
     //              sfdx sfpowerkit:auth:login -u ${sbusername} -p ${sbpassword} -r https:/login.salesforce.com/ -a devorg

                }
            }            
        }
    }
}
