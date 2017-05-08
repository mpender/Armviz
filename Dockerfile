FROM mpender/ansible-docker

RUN useradd armviz

#ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN yum install -y epel-release \
		bzip2 \
		gcc

RUN yum install -y npm \
	#	supervisor

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

WORKDIR /tmp

RUN git clone https://github.com/ytechie/AzureResourceVisualizer.git

WORKDIR /tmp/AzureResourceVisualizer/

RUN chmod -R 777 /tmp/AzureResourceVisualizer/
#RUN npm install && npm build

RUN npm install
RUN npm install -g gulp bower typings typescript

# Bower needs non-root user
USER armviz
WORKDIR /tmp/AzureResourceVisualizer/
RUN bower install

USER root
RUN typings install

EXPOSE 3000 3001

#RUN mkdir -p /var/log/supervisor
#COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["gulp", "serve"]
#CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
#22 8080
#CMD ["cd", "/tmp/AzureResourceVisualizer/","&&" "gulp", "serve"]
#CMD ["/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf "]
#ENTRYPOINT ["/sbin/init"]
#ENTRYPOINT ["cd", "/tmp/AzureResourceVisualizer/", "&&", "gulp", "serve"]
#######
#ENTRYPOINT ["cd", "", "--prefix /opt/arm-visualizer/"]
#######
