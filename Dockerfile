# Use a base image with Java installed
FROM openjdk:8-jdk-alpine

# Set the working directory
WORKDIR /app

# Copy the WAR file to the container
COPY target/test-project-0.0.1-SNAPSHOT.war /app/test.war

# Expose the default port for your application (change if necessary)
EXPOSE 8080

# Define the command to run your application
CMD ["java", "-jar", "/app/test.war"]

