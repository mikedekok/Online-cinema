FROM centos
RUN yum  -y install \
        java-1.8.0-openjdk\
        java-1.8.0-openjdk-devel
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk
RUN yum -y install maven
EXPOSE 9966
COPY /home/kokm/Devops/Online_cinema /Online_cinema
WORKDIR /Online_cinema
CMD ["mvn tomcat7:run"]







 
 
