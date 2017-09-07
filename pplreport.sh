#! /bin/bash

#!/bin/bash

# year
# quarter
# mount

if [ "$1" = "" ]||[ "$2" = "" ]||[ "$3" = "" ]; then
    echo "3 arguments are needed see readme for more info"
elif [ "$2" = "1" ]; then
	quarter = "Jan|Feb|Mar"
elif [ "$2" = "2" ]; then
	quarter = "Apr|May|Jun"
elif [ "$2" = "3" ]; then
	quarter = "Jul|Aug|Sep"
elif [ "$2" = "4" ]; then
	quarter = "Oct|Nov|Dec"
elif 
fi


main() {
grep -E '($quarter)\/$1.*\/$3' ./access.log* | awk '{ SUM += $13} END { print SUM/60/60 }'
}



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


main