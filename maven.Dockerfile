#multi stage build
FROM maven:3.6.1-jdk-8 as build
LABEL maintainer="ankitrawat741@gmail.com"
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src src
RUN mvn clean package
FROM tomcat
COPY --from=build /app/target/dockerDemo-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh","run"]

