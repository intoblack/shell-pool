#!/bin/sh
# system : unix 

A=N
B=N
C=N
while [ $# -ge 1 ] ;do
   if [ "$1"  = "-a" ] && [ $# -gt 1 ];then
       A=$2;
       shift
   elif [ "$1" = "-b" ] && [ $# -gt 1 ];then
       B=$2;
       shift
   elif [ "$1" = "-c" ];then
       C=1
   fi
   shift
done


echo $A $B $C
