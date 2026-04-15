pipeline {
    agent any
    
    stages {
        stage('Clonar Repositorio') {
            steps {
                checkout scm
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    // Construye la imagen usando el Dockerfile de la raíz
                    bat 'docker build -t mi-flask-app:latest .'
                }
            }
        }
        
        stage('Test Local') {
            steps {
                // Levanta el contenedor para ver si responde
                bat 'docker-compose up -d'
                bat 'sleep 5 && curl http://localhost:5000'
                bat 'docker-compose down'
            }
        }

        stage('Deploy') {
            steps {
                // Aquí defines dónde se despliega (ej: produccion)
                bat 'docker-compose up -d --build'
            }
        }
    }
}