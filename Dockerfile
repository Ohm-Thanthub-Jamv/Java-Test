FROM maven:3.5-jdk-8-alpine as builder

COPY src /usr/src/app/src
COPY pom.xml /usr/src/app

RUN mvn -f /usr/src/app/pom.xml clean package

##############################################

FROM openjdk:8-alpine
COPY --from=builder /usr/src/. /usr/app/main.jar

ENTRYPOINT ["java", "-cp", "/usr/app/main.jar"]
