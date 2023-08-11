FROM openjdk:17
MAINTAINER cr0nems
COPY main/java/com/mycompany/app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
