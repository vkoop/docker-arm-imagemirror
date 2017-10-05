#!/bin/bash
set -e

if [ "$1" = 'imagemirror' ]; then
    #exec imagemirror_start_listen
    exec /imagemirror/register_listener.sh
fi

exec "$@"
