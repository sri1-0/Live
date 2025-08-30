# Stage 1: Build the application
FROM openjdk:19-jdk AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src

# Copy Maven wrapper and set permission
COPY mvnw .
COPY .mvn .mvn
RUN chmod +x ./mvnw
RUN ./mvnw clean package -DskipTests

# Stage 2: Create runtime image
FROM openjdk:19-jdk
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
EXPOSE 8080
