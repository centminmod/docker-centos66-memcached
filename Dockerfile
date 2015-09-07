# Setup Memcached on CentOS 6
# Using Remi repo's latest memcached version

FROM centos:6.7
MAINTAINER George Liu <https://github.com/centminmod/docker-centos66-memcached>
# Setup Memcached
RUN yum -y install epel-release nano which && rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm && yum update -y && yum install -y memcached --enablerepo=remi && yum clean all && rm -rf /var/cache/* && echo "" > /var/log/yum.log

# Expose 11211 to outside
EXPOSE 11211

# Service to run
CMD /usr/bin/memcached -m 64 -p 11211 -c 4096 -b 4096 -t 2 -R 200 -n 72 -f 1.25 -u memcached -o slab_reassign slab_automove