pipeline {

    environment {
        registry = "tealecloud/vfense_kube_demp"
        registryCredential = 'dockerhub'
    }
    agent any

    stages {
        stage('Building image') {
            steps{
                script {
                    docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
    } 
}
