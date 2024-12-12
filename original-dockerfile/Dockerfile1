FROM ubuntu
RUN apt update -y && apt install default-jdk -y && apt install wget -y
WORKDIR /opt
RUN wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.28/bin/apache-tomcat-10.1.28.tar.gz
RUN tar -xvzf apache-tomcat-10.1.28.tar.gz
RUN mv apache-tomcat-10.1.28 tomcat10
# WORKDIR /the/workdir/path
EXPOSE 8080
CMD ["tomcat10/bin/catalina.sh", "run"]

