FROM ubuntu:latest
MAINTAINER Luis Sagastume <lsagastume1990@gmail.com>

RUN apt-key update
RUN apt-get update -y &&  apt-get install -y curl
RUN /bin/bash -c "gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3"
RUN /bin/bash -c "curl -sSL https://get.rvm.io | bash -s stable --ruby"
RUN /bin/bash -c "source /usr/local/rvm/scripts/rvm"
RUN /bin/bash -c "gem install --no-ri --no-rdoc geminabox "
RUN /bin/bash -c "gem install --no-ri --no-rdoc puma"
RUN /bin/bash -c "mkdir -p /var/geminabox/data"
ADD ./config/config.ru /var/geminabox/config.ru
VOLUME ["/var/geminabox/data"]
EXPOSE 9292
WORKDIR /var/geminabox
CMD ["rackup", "-S", "Puma"]
