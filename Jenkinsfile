pipeline {
    agent any
    environment {
      locations = "${locations}"
      cluster_count = "${cluster_count}"
      node_type = "${node_type}"
      node_count = "${node_count}"
      kubernetes_version = "${kubernetes_version}"
      storage_account_name = "${storage_account_name}"
      container_name = "${container_name}"
      tfstate_file_name = "${tfstate_file_name}"
      storage_account_access_key = "${storage_account_access_key}"
      TF_Destroy = "${TF_Destroy}"
	    KEY = "key.pem"
    }

      tools {
        terraform 'tf'
      }

    stages {
      stage('Checkout') {
        steps {
          git credentialsId: 'Jenkins-accelitas', url: 'https://github.com/shubham-automation/aks-tf.git', branch: 'main'
        }
      }

      stage('Initialize') {
        steps {
            script {
              def locationCount = sh(
                script: "echo '${env.locations}' | sed 's/[^,]//g' | wc -c",
                returnStdout: true
              ).trim()
            withCredentials([azureServicePrincipal("azure-service-principal")]){
                    
              if (locationCount.toInteger() == env.cluster_count.toInteger()) {
                sh "az login --service-principal -u ${AZURE_CLIENT_ID} -p ${KEY} -t ${AZURE_TENANT_ID}"
                sh '''
                  terraform init -backend-config storage_account_name=${storage_account_name} -backend-config container_name=${container_name} -backend-config key=${tfstate_file_name} -backend-config access_key=${storage_account_access_key}
                '''
              } 
              else {
                echo "Number of LOCATIONS & Number of AKS Clusters counts do not match."
                error("Number of LOCATIONS & Number of AKS Clusters counts do not match.")
              }
            }
        }
      }
    }  
      
      stage('Plan') {
        steps {
            script {
                sh '''
                  terraform plan -var=node_type=${node_type} -var=cluster_count=${cluster_count} -var=locations=${locations} -var=node_count=${node_count} -var=kubernetes_version=${kubernetes_version}
                '''
            }
        }
      }

      stage('Apply') {
        steps {
		  script {
              if (env.TF_Destroy == "Yes") {
                sh '''
                  terraform destroy -auto-approve -var=node_type=${node_type} -var=cluster_count=${cluster_count} -var=locations=${locations} -var=node_count=${node_count} -var=kubernetes_version=${kubernetes_version}
                '''
              } 
              else {
                sh '''
                  terraform apply -auto-approve -var=node_type=${node_type} -var=cluster_count=${cluster_count} -var=locations=${locations} -var=node_count=${node_count} -var=kubernetes_version=${kubernetes_version}
                '''  
              }
	      }
        }
      }
    }
  }
