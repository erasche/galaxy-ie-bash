FROM centos:centos6

RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
RUN yum install -y npm cron

ADD ./monitor_traffic.sh /monitor_traffic.sh
RUN chmod +x /monitor_traffic.sh
RUN echo "* *     * * *   root    /monitor_traffic.sh" >> /etc/crontab


RUN mkdir /import
RUN npm install web-terminal -g
EXPOSE 8088



VOLUME ["/import/"]
WORKDIR /import/
ADD ./startup.sh /startup.sh
RUN chmod +x /startup.sh
CMD /startup.sh
