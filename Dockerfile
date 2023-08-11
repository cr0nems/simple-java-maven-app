FROM openjdk:17
MAINTAINER baeldung.com
COPY main/java/com/mycompany/app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
