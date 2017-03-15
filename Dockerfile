FROM mpender/ansible-docker

RUN yum install -y git \
	epel-release 

RUN yum install -y npm \
	epel-release \
	gcc \
	make
	
WORKDIR /opt

RUN git clone https://github.com/ytechie/AzureResourceVisualizer.git

WORKDIR /opt/AzureResourceVisualizer/

RUN npm install
RUN npm install -g gulp bower typings typescript
RUN bower install --allow-root
RUN typings install

#RUN npm install && npm build

EXPOSE 3000 3001 22 8080

ENTRYPOINT ["cd", "/opt/AzureResourceVisualizer", "&&", "gulp", "serve"]

#ENTRYPOINT ["gulp serve"]
#ENTRYPOINT ["npm", "start", "--prefix /opt/arm-visualizer/"] 

