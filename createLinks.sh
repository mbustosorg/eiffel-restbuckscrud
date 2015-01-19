#!/bin/bash

set -x 

IFS=$'\n'    
LIB_DEF=".* lib.*so.*-> "
SED_DEF="s/\(.* lib.*so.*-> \)\(.*\)/\2/"
LIST=$(ls -lah /usr/lib | grep "$LIB_DEF" | sed "$SED_DEF")
# | grep $LIB_DEF | sed $SED_DEF) )
#echo $LIST
for i in $LIST
do
 ls -lah /usr/lib/$i
done
