#!/bin/bash

set -e

if [ "$DISPLAY" = "" ]; then
  echo "Please set DISPLAY" >&2
  exit 1
fi

if [ ! -e "/tmp/.X11-unix/X${DISPLAY:1}" ]; then
  echo "Please mount /tmp/.X11-unix" >&2
  exit 1
fi


stat "/tmp/.X11-unix/X${DISPLAY:1}" | grep Uid | sed 's#.*Uid:[ (]*\([0-9]*\).*#adduser --uid=\1 --disabled-password user </dev/null#' | bash >/dev/null

exec "$@"
