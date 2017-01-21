#!groovy

node {
    stage('Checkout') {
        checkout scm
    }

    stage('Build') {
        sh 'bundle install'
    }

    stage('Test') {
        sh 'bundle exec rake spec'
    }
}
