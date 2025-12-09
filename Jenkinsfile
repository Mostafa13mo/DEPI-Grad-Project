pipeline {
    agent { label 'JenkinsSlave03' }

    environment {
        DOCKER_CREDENTIALS = credentials('Dockerhub')
        KUBECONFIG = credentials('kubeconfig-creds') 
    }

    stages {
        stage('Build Backend Image') {
            steps {
                dir('backend') {
                    sh 'docker build -t YOUR_REGISTRY/restaurant-backend:latest .'
                }
            }
        }

        stage('Build Frontend Image') {
            steps {
                dir('frontend') {
                    sh 'docker build -t YOUR_REGISTRY/restaurant-frontend:latest .'
                }
            }
        }

        stage('Docker Login') {
            steps {
                sh 'echo $DOCKER_CREDENTIALS_PSW | docker login -u $DOCKER_CREDENTIALS_USR --password-stdin'
            }
        }

        stage('Push Images') {
            steps {
                sh 'docker push YOUR_REGISTRY/restaurant-backend:latest'
                sh 'docker push YOUR_REGISTRY/restaurant-frontend:latest'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f k8s/'
            }
        }
        stage('Install Monitoring Stack') {
            steps {
                withCredentials([file(credentialsId: 'kubeconfig-creds', variable: 'KCFG')]) {
                    sh """
                        export KUBECONFIG=$KCFG

                        # إضافة Helm repo الرسمي
                        helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
                        helm repo update

                        # تثبيت kube-prometheus-stack في namespace monitoring
                        helm upgrade --install monitoring prometheus-community/kube-prometheus-stack \
                            -f monitoring/values.yaml \
                            -n monitoring --create-namespace

                        # تطبيق ServiceMonitor للـ backend
                        kubectl apply -f monitoring/service-monitor-backend.yaml
                    """
                }
            }
        }


    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}

