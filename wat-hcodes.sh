#!/bin/bash
# Author: Yevgeniy Goncharov aka xck, http://sys-adm.in
# Script for search and show HTTP codes
#
PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
SCRIPT_PATH=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)

# Colors
RED='\033[01;31m'
GREEN='\033[01;32m'
YELLOW='\033[01;33m'
BLUE='\033[01;34m'
NONE='\033[0m'

# Check is script does not has arguments
if [[ -z $1 ]]; then
  echo "Please set HTTP code"
  exit 1
fi

# if [[ ! $1 =~ ^[+-]?[0-9]+$ ]]; then
#   echo "Input is an integer."
#   exit 1
# fi

if [[ ! -f /tmp/http-status-codes.csv ]]; then
  curl https://raw.githubusercontent.com/m0zgen/http-codes-spyder/master/codespy/output/http-status-codes.csv -o /tmp/http-status-codes.csv
fi

if grep -q $1 /tmp/http-status-codes.csv ; then
  echo ""
  grep $1 /tmp/http-status-codes.csv | awk -F ";" -v r=$RED -v y=$YELLOW -v g=$GREEN -v b=$BLUE -v n=$NONE \
   '{print "Code: "r$1n " | Status:" y$2n " | Description: " g$4n "\n"}'
else
  echo -e ${RED}HTTP code dos not found!${NONE}
fi