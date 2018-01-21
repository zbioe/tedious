#!/bin/sh

print(){
    if [[ "$VERBOSE" ]];
    then
	filename=/proc/meminfo
	cat ${filename}
    else
        free -htl
    fi
    exit 0
}

case $1 in
     "print")
	print;;
esac
