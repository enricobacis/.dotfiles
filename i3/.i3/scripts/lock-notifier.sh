#!/bin/bash

echo 'locking soon' | osd_cat \
    --lines=1 \
    --pos=middle \
    --align=center \
    --color=red \
    --outline=8 \
    --delay=5 \
    --font='-*-*-bold-*-*-*-140-*-*-*-*-*-*-*'
