pipeline{
    agent{
        label 'iac'
    }
environment{
    AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
    AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
}
stages{
    stage('Git Checkout'){
        steps{
            dir('./gitops'){
                git branch: 'master', credentialsId: 'GithubAccess', poll: false, url: 'https://github.com/sarmistha-jena/Terra-CI-CD.git'
            }
        }
    }
    stage('Terraform initialization'){
        steps{
            dir('./gitops'){
                sh '/usr/bin/terraform init'
            }
        }
    }
    stage('Terraform plan and json output'){
        steps{
            dir('./gitops'){
                sh '/usr/bin/terraform plan -out testplan'
                sh '/usr/bin/terraform show -json testplan > testplan.json'
            }
        }
    }
    stage('Checkov Scan'){
        steps{
            catchError(buildResult: 'SUCCESS', message: 'IAC misconfiguration found', stageResult: 'UNSTABLE'){
                dir('./gitops'){
                    sh 'checkov -f testplan.json'
                }
            }
        }
    }
    stage('Terraform Apply'){
        steps{
            dir('./gitops'){
                sh '/usr/bin/terraform apply -auto-approve'
            }
        }
    }
    /* stage('Terraform Destroy'){
        //when{branch 'dev'}
        steps{
            dir('./gitops'){
                sh '/usr/bin/terraform destroy -auto-approve'
            }
        }
    } */
}
}