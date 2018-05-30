FROM centos:6

RUN rpm --import http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-6 \
	&& rpm --import https://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6 \
	&& rpm --import https://dl.iuscommunity.org/pub/ius/IUS-COMMUNITY-GPG-KEY

RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

RUN yum install -y php \
	httpd \
	mysql \
	php-mysql \
	php-mcrypt \
	php-memecached \
	php-memecache \
	php-opcache \
	php-mbstring \
	php-gd \
	php-zip

COPY ./rootfs /

EXPOSE 80

# RUN groupadd www -g 1000 \
# 	&& useradd www -u 1000 -g www -r -s /sbin/nologin

# USER 1000:1000
# RUN yum install -y mc

CMD ["/usr/sbin/httpd", "-DFOREGROUND"]