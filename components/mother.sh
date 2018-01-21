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
       "Vendor": `< ${dir}/board_vendor`
       "Name": `< ${dir}/board_name`
       "Version": `< ${dir}/board_version`
EOF
    fi
    exit 0
}

case $1 in
    "print")
	print;;
esac
