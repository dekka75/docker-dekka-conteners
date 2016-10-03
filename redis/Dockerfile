# DESCRIPTION:    redis-server
# TO_BUILD:       docker build -t dekka/redis .
# TO_RUN:         docker run -d --name redis -p 6379:6379 -v /opt/dekka/imock/redis-db:/data dekka/redis 
#                 redis-server /etc/redis/redis.conf --requirepass 12345
# TO_EXEC:        docker exec -it redis /bin/bash
# TO_TEST:        docker run -it --rm --link redis:redis dekka/redis bash -c 'redis-cli -h redis'
#                 set test 'hello world'
#                 get test

FROM centos:7
MAINTAINER Didier Kimès <didier.kimes@gmail.com>

# UPDATE OS
RUN yum -y update

# TOOLS
RUN yum install -y net-tools curl wget tar bzip2
RUN yum install -y gcc gcc-c++ kernel-devel make

# Installing redis-server
RUN DIR=$(mktemp -d) && cd ${DIR}; \
	wget http://download.redis.io/redis-stable.tar.gz; \
	tar xvzf redis-stable.tar.gz; \
	cd redis-stable; \
	make; \
	make install; \
	cp -f src/redis-sentinel /usr/local/bin; \
	mkdir -p /data; \
	mkdir -p /etc/redis; \
	cp -f *.conf /etc/redis; \
	cd ..; \
	rm -rf ${DIR}; \
	sed -i 's/^\(bind .*\)$/# \1/' /etc/redis/redis.conf; \
	sed -i 's/^\(daemonize .*\)$/# \1/' /etc/redis/redis.conf; \
	sed -i 's/^\(dir .*\)$/# \1\ndir \/data/' /etc/redis/redis.conf; \
	sed -i 's/^\(logfile .*\)$/# \1/' /etc/redis/redis.conf; \
	sed -i 's/^protected-mode yes$/protected-mode no/' /etc/redis/redis.conf

# Expose ports
EXPOSE 6379

# Define mountable directories
VOLUME ["/data"]

# Define working directory
WORKDIR /data

# Define default command
CMD ["redis-server", "/etc/redis/redis.conf"]
