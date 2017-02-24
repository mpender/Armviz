FROM mpender/ansible-docker

RUN yum install -y git \
	epel-release \
  bzip2

RUN yum install npm -y

WORKDIR /opt

RUN git clone https://github.com/ytechie/AzureResourceVisualizer.git

WORKDIR /opt/AzureResourceVisualizer/

#RUN npm install && npm build

RUN npn install && npm install -g gulp bower typings typescript

RUN bower install --allow-root

RUN typings install

EXPOSE 3000 3001 22 8080

ENTRYPOINT ["cd", "/opt/AzureResourceVisualizer", "&&", "gulp", "serve"]

#######
#ENTRYPOINT ["cd", "", "--prefix /opt/arm-visualizer/"]
#######
