FROM ubuntu:14.04

# Let's start with some basic stuff.
RUN apt-get update && apt-get install -qqy \
    apt-transport-https \
    ca-certificates \
    curl \
    git \
    wget \
    tar
RUN curl -sSL https://get.docker.com | sh
RUN curl -L https://github.com/harbur/captain/releases/download/v0.7.0/captain-`uname -s`-`uname -m` > /usr/local/bin/captain
RUN chmod +x /usr/local/bin/captain
RUN wget https://github.com/jwilder/docker-squash/releases/download/v0.2.0/docker-squash-linux-amd64-v0.2.0.tar.gz &&  tar -C /usr/local/bin -xzvf docker-squash-linux-amd64-v0.2.0.tar.gz
ADD ./bin/build /bin/build
ADD ./bin/wrapdocker /bin/wrapdocker

# Log docker daemon logs to a file
ENV LOG file

VOLUME /var/lib/docker
ENTRYPOINT ["build"]
