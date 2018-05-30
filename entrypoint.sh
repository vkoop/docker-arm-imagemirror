#!/bin/bash
set -e

if [ "$1" = 'imagemirror' ]; then
    exec /usr/bin/supervisord  -c /etc/supervisor/conf.d/supervisord.conf  
else
    exec "$@"
fi
