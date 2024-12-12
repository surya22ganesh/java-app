FROM openjdk
WORKDIR /app
ADD target/*.jar .
ENTRYPOINT [ "java" ]
CMD [ "-jar","*.jar" ]