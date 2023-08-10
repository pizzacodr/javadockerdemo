FROM eclipse-temurin:17-jre-alpine
ADD target/javadockerdemo.jar javadockerdemo.jar
ENTRYPOINT ["java", "-jar","javadockerdemo.jar"]
EXPOSE 8080