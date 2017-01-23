FROM centos:7

RUN yum -y update 

RUN yum reinstall -y glibc-common && yum clean all
RUN localedef -v -c -i ja_JP -f UTF-8 ja_JP.UTF-8; echo "";
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8


RUN yum -y install wget
RUN rpm --import https://download.owncloud.org/download/repositories/stable/CentOS_7/repodata/repomd.xml.key
RUN wget http://download.owncloud.org/download/repositories/stable/CentOS_7/ce:stable.repo -O /etc/yum.repos.d/ce:stable.repo
RUN yum clean expire-cache
RUN yum -y install owncloud

RUN sed -i -e 's@DocumentRoot "/var/www/html"@DocumentRoot "/var/www/html/owncloud"@' /etc/httpd/conf/httpd.conf

VOLUME /var/www/html/owncloud/app
VOLUME /var/www/html/owncloud/data
VOLUME /var/www/html/owncloud/config

EXPOSE 80
EXPOSE 443


CMD ["httpd","-DFOREGROUND"]
