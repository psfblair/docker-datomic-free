# Datomic Free v0.9.4699
#
# It's public image to run datomic database on docker container.

FROM dockerfile/java
MAINTAINER Timo Sulg, timo@tauho.com

#-- INSTALL PREREQURIEMENTS
#update package manager
RUN sudo apt-get -y update

# install curl
RUN sudo apt-get install -y curl
# install unzip
RUN sudo apt-get install -y unzip

#-- INITIALIZE DATOMIC
# create required folders
RUN mkdir temp
RUN mkdir datomic

#initialise global variables
ENV DATOMIC_VERSION 0.9.4699
ENV DATOMIC_HOME /home/docker/datomic
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle
ENV PATH $JAVA_HOME:/bin:/usr/bin:$PATH

# download source
RUN echo Downloading version ${DATOMIC_VERSION}
RUN curl --progress-bar --location\
 --user-agent 'tauhoDB (info@tauho.db)'\
 --url "https://my.datomic.com/downloads/free/${DATOMIC_VERSION}"\
 --output ./temp/datomic.zip

# unzip datomic
RUN unzip -u ~/temp/datomic.zip -d ~/temp

#move unzipped files into own folder and remove temp folder
RUN cp -r ~/temp/datomic-free-${DATOMIC_VERSION}/* ~/datomic
RUN rm -r ~/temp

#-- RUN DATOMIC
# copy default transactor into datomic root
RUN cp ~/datomic/config/samples/free-transactor-template.properties ~/datomic/free-transactor.properties
# -- execute free transactor with default settings
CMD ["/root/datomic/bin/transactor", "/root/datomic/free-transactor.properties"]
EXPOSE 4334

