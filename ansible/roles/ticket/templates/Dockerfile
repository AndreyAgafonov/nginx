FROM openjdk:9
COPY . /opt/
WORKDIR /opt
ENTRYPOINT ["java", "-DHOST=0.0.0.0", "-DGOOGLE_API_KEY=AIzaSyCZps7Au06aE0YBHsUOB_q2IpxfCSVNCY8", "-jar", "ticket-to-ride.fat.jar", "-port=8080"]
