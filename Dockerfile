FROM openjdk:17
MAINTAINER baeldung.com
COPY main/java/com/mycompany/App.jar
ENTRYPOINT ["java","-jar","/App.jar"]
