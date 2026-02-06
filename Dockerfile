FROM gradle:8-jdk21 AS build
WORKDIR /app
COPY . .
RUN gradle clean build --no-daemon

FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=build /app/build/libs /app/libs
EXPOSE 8080
CMD ["sh","-lc","java -jar /app/libs/*.jar"]

