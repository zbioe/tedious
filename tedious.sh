#!/bin/sh

unset $VERBOSE
OPTS=`getopt -o vhp: --long verbose,help,print: -n 'parse-options' -- "$@"`
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

if [ $? != 0 ] ; then echo "Failed parsing options." >&2 ; exit 1 ; fi

eval set -- "$OPTS"

usage(){
    awk '/```usage/{y=1;next}/```/{y=0}y' $DIR/README.md
}

print(){
    component="$DIR/components/${1}.sh"
    if [ ! -f $component ]; then
            echo "[$1] Err: Invalid Option"
            usage
            exit 1
    fi
    sh $component "print" $VERBOSE
}

while true; do
  case "$1" in
    -v | --verbose ) VERBOSE=true && export VERBOSE; shift ;;
    -h | --help ) usage; shift ;;
    -p | --print ) print $2; shift ;;
    -- ) shift; break ;;
    * ) break ;;
  esac
done
