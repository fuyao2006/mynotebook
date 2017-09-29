FROM ubuntu

# Install Java.
COPY sources.list /etc/apt/
RUN \
apt-get update &&\
apt-get install -y software-properties-common openssh-server python-software-properties nano &&\ 
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer &&\
 apt-get remove  -y software-properties-common python-software-properties python python3 &&\
  apt-get -y autoremove
#RUN update-rc.d -f ssh enable 3  

# Define working directory.
WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Define default command.
CMD [ "sh", "-c", "service ssh start;bash"]
