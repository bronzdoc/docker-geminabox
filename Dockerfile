FROM bronzdoc/rvm
MAINTAINER Luis Sagastume <lsagastume1990@gmail.com>

RUN apt-get update -y && apt-get install -y curl \
    && mkdir -p /var/geminabox/data

RUN /bin/bash -c -l "rvm gemset create geminabox \
                     && rvm gemset use geminabox \
                     && gem install --no-ri --no-rdoc geminabox"

ADD ./config/config.ru /var/geminabox/config.ru
ADD ./config/entrypoint.sh /var/geminabox/entrypoint.sh

RUN chmod +x /var/geminabox/entrypoint.sh

VOLUME ["/var/geminabox/data"]
WORKDIR "/var/geminabox/"
EXPOSE 9292
CMD ["/var/geminabox/entrypoint.sh"]
