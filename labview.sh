#!/bin/bash

exec env LD_PRELOAD=/tmp/spd_readdir.so LD_LIBRARY_PATH=/usr/local/lv61/linux /usr/local/lv61/labview
