FROM openjdk
WORKDIR /app
ADD target/*.jar .
EXPOSE 8080
ENTRYPOINT [ "java" ]
CMD [ "-jar","twitter-1.0.jar" ]