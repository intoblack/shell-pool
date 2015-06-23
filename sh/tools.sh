#!/bin/sh

##!function
##! linux命令行解压各种解压包
##!
function untar(){
    
    if [ -f "$1" ];then
        local un_tar_command=`echo "$1"  | awk '{
            if($1 ~/\.tgz$/){
                print "tar -zxvf"
            }else if($1 ~/\.tar\.gz$/){
                print "tar -xzvf"
            }else if($1 ~/\.tar$/){
                print "tar -xvf"
            }else if($1 ~/\.tar\.bz2$/){
                print "tar -xjvf";
            }else if($1 ~/\.tar\.Z$/){
                print "tar -xZvf" ;
            }else if($1 ~/\.rar$/){
                print "unrar e"
            }else if($1 ~/\.zip$/){
                print "unzip"
            }
        }'`
        ${un_tar_command} $1
    else
        echo "$1 not exist file , please check"
    fi


}