FROM openjdk
WORKDIR /app
ADD target/*.jar .
ENTRYPOINT [ "java" ]
CMD [ "-jar","twitter-1.0.jar" ]