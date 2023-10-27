pipeline {
    agent any

    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
        choice(name: 'action', choices: ['apply', 'destroy'], description: 'Select the action to perform')
    }

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
   
    }

    stages {
        stage('Checkout') {
            steps {
               git branch: 'main', credentialsId: 'c8070803-659f-493d-9c3f-ede7f2f00d12', url: 'https://github.com/sunilaws03/terraform-jenkins-pipeline-1.git'
            }
        }
        stage('Terraform init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                
                sh 'terraform plan -no-color -out=create.tfplan'
               
            }
        }
        stage('Apply / Destroy') {
            steps {
               sh 'echo "comienza"'
            script{  
                if (params.action == 'destroy'){
                        
                         sh 'terraform ${action} --auto-approve'
                } else {
                                          
                         sh 'terraform apply -refresh=true -auto-approve'
                           
                }  

            }
         } 
    }
}
}
