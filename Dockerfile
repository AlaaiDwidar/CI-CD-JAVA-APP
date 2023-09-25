# Use an official Tomcat runtime as a parent image
FROM tomcat:9.0-jre11

# Remove the default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the SampleWebApp.war file into the webapps directory
COPY SampleWebApp.war /usr/local/tomcat/webapps/

# Expose the default Tomcat port (8080)
EXPOSE 8080

# Start Tomcat when the container starts
CMD ["catalina.sh", "run"]