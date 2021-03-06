#! /bin/bash

#!/bin/bash

# year
# quarter
# mount

if [ "$1" = "" ]||[ "$2" = "" ]||[ "$3" = "" ]; then
    echo "3 arguments are needed see readme for more info"
elif [ "$2" = "1" ]; then
	quarter="Jan|Feb|Mar"
elif [ "$2" = "2" ]; then
	quarter="Apr|May|Jun"
elif [ "$2" = "3" ]; then
	quarter="Jul|Aug|Sep"
elif [ "$2" = "4" ]; then
	quarter="Oct|Nov|Dec"
fi

escaped=$(echo $3 | sed 's/\./\\\./g')


hours=$(grep -E "($quarter)\/$1.*\/$escaped" ./access.log* | awk '{ SUM += $NF} END { printf int(SUM/60/60)+1 }')

BLUE='\033[;36m'
RED='\033[1;31m'
NC='\033[0m' # No Color
echo -e "For ${BLUE}Quarter $2 $1${NC} your total listener hours for mount ${BLUE}$3${NC} is ${RED}$hours${NC}"



# interactive=
# filename=~/sysinfo_page.html

# while [ "$1" != "" ]; do
    # case $1 in
        # -f | --file )           shift
                                # filename=$1
                                # ;;
        # -i | --interactive )    interactive=1
                                # ;;
        # -h | --help )           usage
                                # exit
                                # ;;
        # * )                     usage
                                # exit 1
    # esac
    # shift
# done