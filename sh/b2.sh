#!/bin/sh


function showHdfsFolderSize()
{
        awk -v OFS="\t" 'function byte2Tb(bytes)
        { 
                if (bytes >= TB )
                        { 
                                return (bytes / TB )" TB";
                        } else if(bytes > GB)
                        {
                                return (bytes / GB )" GB";
                        } else 
                        { 
                                return (bytes/MB)" MB";
                        }
                }
                BEGIN{
                total=0;
                part=0;
                MB=1024 * 1024  ; 
                GB=1024 * MB  ; 
                TB = 1024 * GB ;
        }{
        if(NF==2)
                { 
                        print $1,byte2Tb($2) ; 
                        total+=$2
                }else if(NF==8)
                {
                        print $8 , byte2Tb($5);
                        total+=$5 ;
                }else
                {
                        print "erro" , $0 ;
                } 
        } 
        END{
        print "tatal :" , byte2Tb(total);
}'

}





function set_filter()
{
        local __KEYS=$1 

        awk -v keys_index=$__KEYS  '
        BEGIN{
        merge_char = "!!#!!";
        key_split_char = "#" ;
        split(keys_index ,key_array ,key_split_char);
}{
merge_key = "" ;
for(key_index  in  key_array){
        merge_key = merge_key""merge_char""$key_array[key_index] ;
}
if(sets[merge_key]){
        sets[merge_key] += 1 ;  
}else{
sets[merge_key] = 1 ; 
  }
}END{
for(set in sets){
        split(set , names ,merge_char ) ;
        name = "" ;
        for(nn in names){
                if(names[nn] == "")
                        {
                                continue ;
                        }
                        if(name == ""){
                                name = names[nn];
                        }else{
                        name = name"->"names[nn]  ;
                }
        }
        print name , sets[set] ;
        delete names ;
}
}' | sort -k 1 
}



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

function gitpush(){
    git pull
    git add -A
    git commit -m "$1"
    git push 



}



function calc(){
    
    echo | awk '{print ('"$*"')}'

}
function jj(){
    if [ "$1" == "" ];then
        return
    fi
    cd `echo "$1" | awk -F "." '{if(NF == 1) {print "."} else {s = "" ; for(i = 3;i<=NF;i++){s="../"s};print s}}'`
}
