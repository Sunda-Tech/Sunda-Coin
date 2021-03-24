#!/bin/sh
APPLICATION="SundaCoin"

if [ -e SundaCoin.pid ]; then
    PID=`cat SundaCoin.pid`
    ps -p $PID > /dev/null
    STATUS=$?
    echo "stopping"
    while [ $STATUS -eq 0 ]; do
        kill `cat SundaCoin.pid` > /dev/null
        sleep 5
        ps -p $PID > /dev/null
        STATUS=$?
    done
    rm -f SundaCoin.pid
    echo "Nxt server stopped"
fi

