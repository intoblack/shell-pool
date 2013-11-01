#!/bin/sh


#得到文件行数


NULL='\0'
__RESULT=$NULL
get_file_line()
{
	_sum=$(wc -l $1 | tail -n 1 | awk '{print $1}')
	return $_sum
}

#删除没有行数的空文件
rm_zero_line()
{
	for file in $( wc -l * | awk '{if($1==0) print $2}');do
		if [ -f $file ];then
			rm $file
		fi
	done
}


read_file_line()
{
      if [ ! -f $1 ] ; then

          return
      fi
      while read -r line;do  $line ; done < $1
}

get_newest_change_file()
{
    if [ -d $1 ] ; then
        __RESULT=$( ls -lht  | head -n 2 | tail -n 1 | awk '{print $9}' )
    else :
        __RESULT=$NULL
    fi
}

get_newest_change_file /home/lixuze/Script/sh/
echo $__RESULT




