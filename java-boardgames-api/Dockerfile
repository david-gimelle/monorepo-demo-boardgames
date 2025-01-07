# Use an official Gradle image to build the application
FROM gradle:8.7-jdk21 AS build

# Set the working directory
WORKDIR /app

# Copy the Gradle wrapper and build files
COPY gradlew .
COPY gradle gradle
COPY app/build.gradle.kts .
COPY settings.gradle.kts .

# Copy the source code
COPY app/src src

# Build the application
RUN ./gradlew build --no-daemon

# Use an official OpenJDK runtime as a parent image
FROM openjdk:21-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the built application from the build stage
COPY --from=build /app/build/libs/*.jar app.jar

# Expose the port the application runs on
EXPOSE 8082

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]