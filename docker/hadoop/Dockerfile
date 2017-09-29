#hadoop

FROM  java

MAINTAINER   fuyao<fuyaoaa@qq.com>

WORKDIR /root
ENV HADOOP_VERSION=2.7.3

# install openssh-server, openjdk and wget
#RUN apt-get update && apt-get install -y python-software-properties  software-properties-common
#RUN add-apt-repository ppa:webupd8team/java 
RUN  apt-get update && apt-get install -y   wget &&\
     groupadd fuyao && useradd -g fuyao -m fuyao &&\
# install hadoop 
#wget http://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-2.8.0/hadoop-2.8.0.tar.gz &&\
wget  https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz &&\
#RUN wget https://github.com/kiwenlau/compile-hadoop/releases/download/2.7.2/hadoop-2.7.2.tar.gz && \
#COPY hadoop-${HADOOP_VERSION}.tar.gz .  &&\
 tar -xzvf hadoop-${HADOOP_VERSION}.tar.gz && \
    rm -rf hadoop-${HADOOP_VERSION}/share/doc/hadoop/* && \
    mv hadoop-${HADOOP_VERSION} /usr/local/hadoop && \
    rm hadoop-${HADOOP_VERSION}.tar.gz  &&\
    apt-get clean && apt-get -y autoremove &&\
    chown -R fuyao:fuyao /usr/local/hadoop 
# set environment variable
#USER fuyao
ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle
ENV HADOOP_HOME=/usr/local/hadoop 
ENV PATH=$PATH:/usr/local/hadoop/bin:/usr/local/hadoop/sbin 
#RUN mkdir -p /var/run/sshd &&\
#chown -R fuyao:fuyao /etc/ssh

USER fuyao
WORKDIR /home/fuyao
# ssh without key
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys


RUN mkdir -p ~/hdfs/namenode && \ 
    mkdir -p ~/hdfs/datanode && \
    mkdir -p $HADOOP_HOME/logs &&\
    mkdir -p ~/tmp

COPY hadoop-cluster-docker/config/* /home/fuyao/tmp/

RUN cp ~/tmp/ssh_config ~/.ssh/config && \
    cp ~/tmp/hadoop-env.sh /usr/local/hadoop/etc/hadoop/hadoop-env.sh && \
    cp ~/tmp/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml && \ 
    cp ~/tmp/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml && \
    cp ~/tmp/mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml && \
    cp ~/tmp/yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml && \
    cp ~/tmp/slaves $HADOOP_HOME/etc/hadoop/slaves && \
    cp ~/tmp/start-hadoop.sh ~/start-hadoop.sh && \
    cp ~/tmp/run-wordcount.sh ~/run-wordcount.sh &&\
    echo 'PATH=$PATH:/usr/local/hadoop/bin:/usr/local/hadoop/sbin' >>~/.bashrc

RUN chmod +x ~/start-hadoop.sh && \
    chmod +x ~/run-wordcount.sh && \
    chmod +x $HADOOP_HOME/sbin/start-dfs.sh && \
    chmod +x $HADOOP_HOME/sbin/start-yarn.sh 
# format namenode

RUN /usr/local/hadoop/bin/hdfs namenode -format

# Hdfs ports
#EXPOSE 50010 50020 50070 50075 50090 8020 9000
# Mapred ports
#EXPOSE 10020 19888
#Yarn ports
#EXPOSE 8030 8031 8032 8033 8040 8042 8088
#Other ports
#EXPOSE 49707 2122
#RUN chown -R fuyao:fuyao /usr/local/hadoop
#USER fuyao
USER root

CMD [ "sh", "-c", "service ssh start;bash"]

