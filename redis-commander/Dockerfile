# DESCRIPTION:      redis-commander
# TO_BUILD:         docker build -t dekka/redis-commander .
# TO_RUN:           docker run -it --rm --name redis-commander -p 8081:8081 dekka/redis-commander
# TO_EXEC:          docker exec -it redis-commander /bin/bash
# TO_RUN_APP:       redis-commander

FROM centos:7
MAINTAINER Didier Kimès <didier.kimes@gmail.com>

# UPDATE OS
RUN yum -y update

# TOOLS
RUN yum install -y net-tools curl wget tar bzip2

# Installing node via package manager
RUN yum -y install epel-release
RUN yum -y install npm nodejs
RUN npm install inherits -g
RUN npm install redis-commander -g

# Expose ports
EXPOSE 8081

# Define the entrypoint script.
ENTRYPOINT ["redis-commander"]