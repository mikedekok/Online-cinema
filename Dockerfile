
FROM centos
RUN yum  -y install \
        java-1.8.0-openjdk\
        java-1.8.0-openjdk-devel
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk
RUN yum -y install maven
EXPOSE 9966
ARG online=http://localhost:8081/service/rest/v1/search/assets/download?repository=maven-public&group=org.springframework.samples.service.service&name=cinema&maven.extension=war&sort=version&direction=desc
COPY $Online /app
WORKDIR /app
CMD ["mvn tomcat7:run"]







 
 
