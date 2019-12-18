FROM centos:7 as builder 
RUN yum install -y epel-release && yum install -y curl wget bzip2 
WORKDIR /opt
RUN wget http://mirror.linux-ia64.org/apache/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz && tar xzf /opt/spark-2.4.4-bin-hadoop2.7.tgz -C /opt/

FROM centos:7
RUN yum install -y epel-release && yum install -y curl wget vim java-1.8.0-openjdk
RUN mkdir -p /opt/spark
COPY --from=builder /opt/spark-2.4.4-bin-hadoop2.7/* /opt/spark/
WORKDIR /opt/spark

