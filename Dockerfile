FROM ubuntu:14.04

# Let's start with some basic stuff.
RUN apt-get update && apt-get install -qqy \
    apt-transport-https \
    ca-certificates \
    curl \
    git \
    wget
RUN curl -sSL https://get.docker.com | sh
RUN curl -L https://github.com/harbur/captain/releases/download/v0.7.0/captain-`uname -s`-`uname -m` > /usr/local/bin/captain
RUN chmod +x /usr/local/bin/captain

ADD ./bin/build /bin/build
ADD ./bin/wrapdocker /bin/wrapdocker

# Log docker daemon logs to a file
ENV LOG file

VOLUME /var/lib/docker
ENTRYPOINT ["build"]
