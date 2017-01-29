FROM mpender/ansible-docker

RUN yum install -y git \
	epel-release 

RUN yum install npm -y
	
WORKDIR /opt

RUN git clone https://github.com/msshli/arm-visualizer.git

WORKDIR /opt/arm-visualizer/

RUN npm install && npm build

EXPOSE 3000 3001 22 8080

ENTRYPOINT ["npm", "start", "--prefix /opt/arm-visualizer/"] 

