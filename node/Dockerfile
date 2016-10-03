# DESCRIPTION:      node
# TO_BUILD:         docker build -t dekka/node .
# TO_RUN:           docker run -it --rm --name node -p 8080:3000 -p 8081:5858 -v /opt/dekka/node/app:/opt/node dekka/node
# TO_RUN:           docker run -it --rm --name node -p 8080:3000 -p 8081:5858 -v /opt/dekka/imock/server:/opt/node dekka/node
# TO_EXEC:          docker exec -it node /bin/bash
# TO_TEST:          docker exec -it node ./node_modules/.bin/mocha --reporter spec
# TO_RUN_APP:       express app
#                   cd app
#                   npm install
#                   DEBUG=app:* npm start

FROM centos:7
MAINTAINER Didier Kimès <didier.kimes@gmail.com>

# UPDATE OS
RUN yum -y update

# TOOLS
RUN yum install -y net-tools curl wget tar bzip2

# Install npm 3.8.6 & nodejs 6.4.0
RUN curl -sL https://rpm.nodesource.com/setup_6.x | bash -
RUN yum -y install nodejs
RUN npm install express-generator -g
RUN npm install nodemon --no-optional -g

# Install nodejs app
COPY express-dekka-app.tar /home/express-dekka-app.tar
COPY imock-dekka-server.tar /home/imock-dekka-server.tar

# Expose ports
EXPOSE 8080 5858

# Define mountable directories
VOLUME ["/opt/node"]

# Define working directory
WORKDIR /opt/node

# Define default command
ENV DEBUG app:*
ENV DEKKA_APP_NAME express

# Startup imock-server
ADD startup.sh /home/startup.sh
RUN chmod +x /home/startup.sh

CMD ["/bin/bash", "/home/startup.sh"]
