FROM centos:7
RUN yum -y update
RUN yum install -y \
   java-1.8.0-openjdk \
   java-1.8.0-openjdk-devel
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk/
RUN yum -y install maven
COPY . /OnlineCinema
WORKDIR /OnlineCinema
RUN mvn clean
EXPOSE 9966
CMD ["mvn","tomcat7:run"]







 
 
