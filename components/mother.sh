#!/bin/sh

print(){
    if [[ "$VERBOSE" ]];
    then
	sudo dmidecode -t 2
	lspci
    else
	dir=/sys/devices/virtual/dmi/id
        cat <<EOF
Mother Board:
       "Vendor": $(cat ${dir}/board_vendor)
       "Name": $(cat ${dir}/board_name)
       "Version": $(cat ${dir}/board_version)
EOF
    fi
    exit 0
}

case $1 in
    "print")
	print;;
esac
