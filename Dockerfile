FROM mpender/ansible-docker

RUN useradd armviz

RUN yum install -y epel-release 

RUN yum install npm -y

WORKDIR /opt

RUN git clone https://github.com/ytechie/AzureResourceVisualizer.git

WORKDIR /opt/AzureResourceVisualizer/

#RUN npm install && npm build

RUN npm install
RUN npm install -g gulp bower typings typescript

# Bower needs non-root user
USER armviz
RUN bower install --allow-root

USER root
RUN typings install

#EXPOSE 3000 3001 22 8080

ENTRYPOINT ["cd", "/opt/AzureResourceVisualizer", "&&", "gulp", "serve"]

#######
#ENTRYPOINT ["cd", "", "--prefix /opt/arm-visualizer/"]
#######
