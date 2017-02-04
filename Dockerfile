# Dockerfile creating ubuntu image with Python, Ruby and miscellaneous
# tools needed for homes deployment and builds.

# Use for local testing to mock build and deployment through bamboo

# Pull base image.
FROM ubuntu:14.04

# Basic DockerInstall.
RUN \
    sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y build-essential && \
    apt-get install -y software-properties-common && \
    apt-get install -y byobu curl git htop man unzip vim wget
    # i think this is the cache that shits when you dont apt-get update each time
    #rm -rf /var/lib/apt/lists/*

CMD ["bash"]
RUN \
    # Install python
    apt-get install -y python python-dev python-pip python-virtualenv

# Install bamboo dependencies + miscellaneous
RUN apt-get install libkrb5-dev -y && \
    apt-get install ruby-dev gcc make -y

# Install fucking package manager
RUN gem install fpm


COPY create_bamboo_info.sh /tmp/
CMD ["bash", "/tmp/create_bamboo_info.sh"]


# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
