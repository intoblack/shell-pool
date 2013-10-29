#!/bin/bash
#coder:intoblack


TRUE=1
FALSE=0
WRONG=-1

len()
{
	if [  $# -lt 1 ]; then
		return 0
	fi
	_len=$(expr length $1)
	return $_len
}


isEmpty()
{
	len $1
	
	if [ $? -eq 0 ]; then
		return $TRUE
	else
		return $FALSE
	fi
}


startwith()
{
	if [ $# -lt 2 ]; then
		return $FALSE
	fi
	_same=$(echo "$1" | grep "^$2" )
	if [ "$_same" = "" ]; then
		return $FALSE
	else
		return $TRUE
	fi
}


endwith()
{
	if [ $# -lt 2 ]; then
		return $FALSE
	fi
	_same=$(echo "$1" | grep "$2$" )
	if [ "$_same" = "" ]; then
		return $FALSE
	else
		return $TRUE
	fi
}


split()
{
	return $WRONG
}


lowercase()
{
	return $( echo $1 | tr "[A-Z]" "[a-z]" )
}



lowercase "ABCDEF" 

echo $?

