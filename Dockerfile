FROM tomcat
LABEL maintainer="ankitrawat741@gmail.com"
COPY target/dockerDemo-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh","run"]
