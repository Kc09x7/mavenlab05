# # Use Maven to build the application
# FROM maven:3.8.5-openjdk-17 AS build

# WORKDIR /app

# # Copy all files to the container
# COPY . .

# # Build the project and package the WAR
# RUN mvn clean package

# # Use Tomcat 10.1 base image
# FROM tomcat:10.1-jdk17

# # Remove default webapps
# RUN rm -rf /usr/local/tomcat/webapps/*

# # Copy WAR file from build stage and deploy it as ROOT.war
# COPY --from=build /app/target/mavenlab519.war /usr/local/tomcat/webapps/ROOT.war

# # Expose default Tomcat port
# EXPOSE 8080

# # Start Tomcat server
# CMD ["catalina.sh", "run"]


FROM tomcat:10.1-jdk17

# Remove default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR file from local target folder to ROOT.war in Tomcat
COPY target/mavenlab519.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
