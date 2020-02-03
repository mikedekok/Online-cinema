FROM centos:7
RUN yum -y update && \
 yum -y install wget && \
 yum -y install tar
RUN yum install -y \
   java-1.8.0-openjdk \
   java-1.8.0-openjdk-devel\
   git
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk/
RUN yum -y install maven
# Copy over private key, and set permissions
# Warning! Anyone who gets their hands on this image will be able
# to retrieve this private key file from the corresponding image layer
COPY . /Online-Cinema
WORKDIR /Online-Cinema
CMD ["mvn","clean"]
EXPOSE 9966
CMD ["mvn","tomcat7:run"]



 
 
