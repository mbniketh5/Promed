#ECR Login Stage
stage('ECR Login') {
    steps {
        sh '''
        aws ecr get-login-password \
        --region ap-south-1 | \
        docker login \
        --username AWS \
        --password-stdin \
        i-0e70d648266a8b8b9.dkr.ecr.ap-southeast-2.amazonaws.com
        '''
    }
}
#Build Main Image
stage('Build Main App') {
    steps {
        sh '''
        docker build \
        -t promed-main:v1 \
        -f Dockerfile .
        '''
    }
}
#Tag Image For ECR
stage('Tag Main Image') {
    steps {
        sh '''
        docker tag promed-main:v1 \
        i-0e70d648266a8b8b9.dkr.ecr.ap-southeast-2.amazonaws.com/promed-main:v1
        '''
    }
}
#Push Main Image
stage('Push Main Image') {
    steps {
        sh '''
        docker push \
        i-0e70d648266a8b8b9.dkr.ecr.ap-southeast-2.amazonaws.com/promed-main:v1
        '''
    }
}
#Dashboard Service
stage('Build Dashboard') {
    steps {
        sh '''
        docker build \
        -t dashboard:v1 \
        -f dashboard/Dockerfile dashboard/
        '''
    }
}

stage('Push Dashboard') {
    steps {
        sh '''
        docker tag dashboard:v1 \
        i-0e70d648266a8b8b9.dkr.ecr.ap-southeast-2.amazonaws.com/dashboard:v1

        docker push \
        i-0e70d648266a8b8b9.dkr.ecr.ap-southeast-2.amazonaws.com/dashboard:v1
        '''
    }
}
#Inventory Service
stage('Build Inventory') {
    steps {
        sh '''
        docker build \
        -t inventory:v1 \
        -f inventory/Dockerfile inventory/
        '''
    }
}

stage('Push Inventory') {
    steps {
        sh '''
        docker tag inventory:v1 \
        i-0e70d648266a8b8b9.dkr.ecr.ap-southeast-2.amazonaws.com/inventory:v1

        docker push \
        i-0e70d648266a8b8b9.dkr.ecr.ap-southeast-2.amazonaws.com/inventory:v1
        '''
    }
}
#Reports Service
stage('Build Reports') {
    steps {
        sh '''
        docker build \
        -t reports:v1 \
        -f reports/Dockerfile reports/
        '''
    }
}

stage('Push Reports') {
    steps {
        sh '''
        docker tag reports:v1 \
        i-0e70d648266a8b8b9.dkr.ecr.ap-southeast-2.amazonaws.com/reports:v1

        docker push \
        i-0e70d648266a8b8b9.dkr.ecr.ap-southeast-2.amazonaws.com/reports:v1
        '''
    }
}
#Deploy To EKS
stage('Deploy To EKS') {
    steps {
        sh '''
        aws eks update-kubeconfig \
        --region ap-southeast-2 \
        --name promed-eks

        kubectl apply -f k8s/
        '''
    }
}
