# Étape 1 : Build avec Maven
FROM maven:3.9-eclipse-temurin-21 AS builder

WORKDIR /app

# Copier uniquement ce qui est nécessaire pour builder
COPY pom.xml .
COPY src ./src

# Build du projet (skip des tests unitaires ici)
RUN mvn clean package -DskipTests

# Étape 2 : Image légère d'exécution
FROM eclipse-temurin:21-jdk-alpine

WORKDIR /app

# Copier uniquement le JAR généré depuis l'étape builder
COPY --from=builder /app/target/spring-demo-app-0.0.1-SNAPSHOT.jar app.jar

# Exposer le port d'écoute
EXPOSE 8080

# Commande de lancement
CMD ["java", "-jar", "app.jar"]
