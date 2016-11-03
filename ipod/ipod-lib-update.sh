#!/bin/bash
function block {
    while : ; do
        [[ -d "/media/eyal/iPodClassic/Music" ]] && break
        echo "Pausing until file exists."
        sleep 1
    done
}
function sync {
    sleep 5
    /usr/bin/rsync -rvs --ignore-existing /data/Music/ /media/eyal/iPodClassic/Music/
    #&& /usr/bin/play /home/eyal/Documents/success.mp3
}

(block && sync &)
