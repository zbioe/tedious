#!/bin/sh

OPTS=`getopt -o vhp: --long verbose,help,print: -n 'parse-options' -- "$@"`

if [ $? != 0 ] ; then echo "Failed parsing options." >&2 ; exit 1 ; fi

eval set -- "$OPTS"

usage(){
        cat << EOF
Usage:
      $0
        -h | --help     Help
        -v | --verbose  Verbose activate
        -p | --print (Use verbose for more info)
	   "videoboard" Video Board Info
	   "motherboard" Mother Board Info
	   "soundboard" Sound Board Info
EOF
}

print(){
    case "$1" in
	"videoboard")
	    print_video_card $1
	    ;;
	*)
	    echo "Err: Invalid Option"
	    usage
	    exit 1
    esac
}

print_video_card(){
	query=$(glxinfo | grep OpenGL)
	echo "Video Card Used:"$(head -n1 <<< $query | cut -f2 -d:)
	if [ $VERBOSE ];
	then
		verbose "$query"
	fi
	exit 0
}

verbose(){
    cat <<EOF
--- Verbose Mode ---
$1
EOF
}

while true; do
  case "$1" in
    -v | --verbose ) VERBOSE=true; shift ;;
    -h | --help ) usage; shift ;;
    -p | --print ) print $2; shift ;;
    -- ) shift; break ;;
    * ) break ;;
  esac
done