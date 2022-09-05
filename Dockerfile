FROM adoptopenjdk/openjdk11:alpine-jre
EXPOSE 8000
ADD target/GreenCommute-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]