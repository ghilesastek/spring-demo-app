FROM eclipse-temurin:21-jdk

WORKDIR /app

COPY . .

RUN ./mvnw clean package -DskipTests

RUN ./mvnw --version

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "target/demo-0.0.1-SNAPSHOT.jar"]
