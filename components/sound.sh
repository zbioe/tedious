#!/bin/sh

print(){
        if [[ "$VERBOSE" ]];
        then
	    lsmod | grep snd
	else
	    dir=/proc/asound/cards
            cat ${dir}/cards
        fi
        exit 0
}

case $1 in
     "print")
	print;;
esac
