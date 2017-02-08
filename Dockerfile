FROM rdebourbon/docker-base
MAINTAINER rdebourbon@xpandata.net

# add our user and group first to make sure their IDs get assigned regardless of what other dependencies may get added.
RUN groupadd -r librarian && useradd -r -g librarian librarian

COPY settings.json /var/lib/transmission-daemon/info/settings.json

RUN add-apt-repository -y ppa:transmissionbt/ppa && \
    apt-get -q update && \
    apt-get install -qy --force-yes transmission-daemon ca-certificates wget tar curl unrar-free procps && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/tmp/* && \
    rm -rf /tmp/*

RUN mkdir -p /volumes/config && \
    mkdir -p /volumes/media && \
    chown -R librarian:librarian /volumes


VOLUME ["/volumes/media", "/volumes/config"]

ADD ./settings.json /var/lib/transmission-daemon/info/settings.json

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

EXPOSE 9091 45555

ENV USERNAME="transmission" \
    PASSWORD="password"

USER librarian 

CMD ["/start.sh"]
