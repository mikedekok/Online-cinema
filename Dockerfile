FROM centos:7
RUN yum  -y install \	RUN yum -y update && \
        java-1.8.0-openjdk\	 yum -y install wget && \
        java-1.8.0-openjdk-devel	 yum -y install tar
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk	RUN yum install -y \
   java-1.8.0-openjdk \
   java-1.8.0-openjdk-devel
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk/
RUN yum -y install maven	RUN yum -y install maven
COPY . /OnlineCinema
WORKDIR /OnlineCinema
RUN mvn clean
EXPOSE 9966	EXPOSE 9966
COPY /home/kokm/Devops/Online_cinema /Online_cinema	CMD ["mvn","tomcat7:run"]




 
 
