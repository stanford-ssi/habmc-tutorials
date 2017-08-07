# base it off of the ruby 2.4 iage from dockerhub, which installs ruby and gets that set up
FROM ruby:2.4

# install fish for this OS
RUN echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_8.0/ /' >> /etc/apt/sources.list.d/fish.list && \
    apt-get update && \
    wget -qO - http://download.opensuse.org/repositories/shells:fish:release:2/Debian_8.0/Release.key | apt-key add - && \
    apt-get update && \
    apt-get install -y fish

# do everything out of the folder /root
WORKDIR /home

# start the fish shell running
CMD fish