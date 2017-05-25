FROM centos:7.3.1611
MAINTAINER shadowsocks for docker <https://hub.docker.com/u/ssorg/>

RUN yum install -y python-setuptools m2crypto; yum clean all
RUN easy_install pip
RUN pip install shadowsocks
# test
#RUN /usr/bin/ssserver -k 1234 -d start
#RUN sslocal -s 127.0.0.1 -k 1234 &
#RUN curl --socks5 127.0.0.1:1080 google.com

ADD ./entrypoint.sh /entrypoint.sh
RUN chmod 700 /entrypoint.sh 

# run with -p XX:XX, not -P
#EXPOSE

ENTRYPOINT ["/entrypoint.sh"]
