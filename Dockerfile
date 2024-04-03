FROM openjdk:17-jdk-slim

ADD target/springboot-docker-k8s.jar springboot-docker-k8s.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","springboot-docker-k8s.jar"]