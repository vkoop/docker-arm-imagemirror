FROM armhf/ubuntu:trusty

RUN apt-get update \
    && apt-get install -y git  inotify-tools imagemagick  \
    && apt-get -q clean \
    && rm -rf /var/lib/apt/lists/*

COPY ./imagemirror /imagemirror

RUN ln -s /imagemirror/register_listener.sh /usr/local/bin/imagemirror_start_listen 
RUN chmod +x /usr/local/bin/imagemirror_start_listen

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
RUN ln -s usr/local/bin/entrypoint.sh / # backwards compat

ENTRYPOINT ["entrypoint.sh"]

CMD ["imagemirror"]