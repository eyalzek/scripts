#!/bin/bash

function usage() {
    echo "'$0 start' - will connect the VPN to all environments"
    echo "'$0 stop'  - will stop all VPN connections"
    exit 0
}

function start() {
    for env in $(find /etc/openvpn/ -type d -not -name devices -not -path /etc/openvpn/)
    do
        echo "connecting to $env"
        openvpn --log-append /var/log/openvpn.log --verb 3 --script-security 2 --cd $env --config eyal.conf &
    done
}

function stop() {
    echo "killing all openvpn processes"
    killall openvpn
}

if [ $# -lt 1 ]; then
    usage
else
    case $1 in
        start)
            start
            ;;

        stop)
            stop
            ;;
        *)
            usage
            ;;
    esac
fi
