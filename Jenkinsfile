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
                    echo $PATH
                    pwd
                    sfdx --version
                    sfdx auth:jwt:grant --clientid ${SB_CLIENTID} --jwtkeyfile ${SERVER_KEY} --username ${SB_USERNAME} --instanceurl ${SB_URL} --setalias devorg
                    '''
                }   
            }

        }
        stage('deltapkg') {    
            steps{
                sh '''
                     sfdx sfpowerkit:project:diff --revisionfrom ${{manual_commit_id_from}} --revisionto ${{manual_commit_id_from}} --output OutputFolder
                '''
          
            }
        stage('package') {
            steps {
                sh '''
                cd SalesforceCICD
                echo 'checkonlydeployment'
                    ls -ltra
                    cd dkg
                    ls -ltra
                    cat diff.json
                    ls -ltr
                    tree force-app/main/default
                sfdx force:source:deploy -c -p force-app -u devorg
                '''   
            }    

        }  
    }     
}  
