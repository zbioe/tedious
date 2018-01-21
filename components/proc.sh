#!/bin/sh

print(){
    filename=/proc/cpuinfo
    if [[ "$VERBOSE" ]];
    then
	cat ${filename}
    else
        head ${filename}
    fi
    exit 0
}

case $1 in
     "print")
	print;;
esac
