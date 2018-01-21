#!/bin/sh

print(){
    query=$(glxinfo | grep OpenGL)
    if [[ "$VERBOSE" ]];
    then
        echo "$query"
    else
	echo "Video Card Used:"$(head -n1 <<< $query | cut -f2 -d:)
    fi
    exit 0
}

case $1 in
    "print")
	print;;
esac
