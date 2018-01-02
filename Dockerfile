FROM resin/rpi-raspbian

RUN apt-get update \
    && apt-get install -y git  inotify-tools imagemagick supervisor \
    && apt-get -q clean \
    && rm -rf /var/lib/apt/lists/*

COPY ./imagemirror /imagemirror

RUN chmod +x /imagemirror/register_listener.sh

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY entrypoint.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]

CMD ["imagemirror"]
