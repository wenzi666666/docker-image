#tomcat8.5.56

FROM centos:7.7.1908

LABEL wenzi 692383247@qq.com

ADD /root/deploy/jdk-8u251-linux-x64.tar.gz /usr/local/

ADD /root/deploy/apache-tomcat-8.5.56.tar.gz /usr/local/

RUN yum install -y epel-release && yum install -y vim wget tree lrzsz gcc gcc-c++ automake pcre pcre-devel zlib zlib-devel openssl openssl-devel iproute net-tools iotop unzip

ENV MYPATH /usr/local/

WORKDIR $MYPATH

RUN ln -sv /usr/local/jdk1.8.0_251 /usr/local/jdk && ln -sv /usr/local/apache-tomcat-8.5.56 /usr/local/tomcat8

ENV JAVA_HOME /usr/local/jdk
ENV CLASSPATH $JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV CATALINA_HOME /usr/local/tomcat8
ENV CATALINA_BASE /usr/local/tomcat8
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/lib:$CATALINA_HOME/bin

COPY server.xml /usr/local/tomcat8/conf/server.xml

ADD static.tar.gz /usr/local/tomcat8/webapps

COPY run_tomcat.sh /usr/local/tomcat8/bin/run_tomcat.sh 

#RUN chown -R tfedu:tfedu /usr/local/apache-tomcat-8.5.56 && chown -R tfedu:tfedu /usr/local/tomcat && chmod -R g+w /usr/local/apache-tomcat-8.5.56 && chmod -R g+w /usr/local/tomcat

EXPOSE 8080 8005 8009

CMD ["/usr/local/tomcat8/bin/run_tomcat.sh"]
