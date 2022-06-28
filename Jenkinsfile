pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('fbc_aws_key')
        AWS_SECRET_ACCESS_KEY = credentials('fbc_aws_pass')
    }

    stages {
        stage ('Terraform init') {
            steps {
                sh 'terraform init'
            }
        }
        stage ('Terraform plan') {
            when {
                not {
                    branch 'main'
                }
            }
            steps {
                sh 'terraform plan'
            }
        }
        stage ('Terraform apply') {
            when {
                branch 'main'
            }
            steps {
                sh 'terraform apply --auto-approve'
            }
        }
        stage ('Ansible otras ramas') {
            when {
                not {
                    branch 'main'
                }
            }
            steps {
                sh 'ansible-playbook retoAnsible.yml --check'
            }
        }
        stage ('Ansible rama Main') {
            when {
                branch 'main'
            }
            steps {
                sh 'ansible-playbook retoAnsible.yml'
            }
        }
    }
}
