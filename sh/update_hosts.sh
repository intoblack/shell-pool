#!/bin/sh
##! create by intohole
##! update ubuntu linux hosts , to connetct google.com 
##!
##!
##!
##!
##!
##!
##!






wget https://raw.githubusercontent.com/racaljk/hosts/master/hosts -qO /tmp/hosts 
[ $? -ne 0 ] && exit 1
mkdir /etc/hosts_bak 
cp /etc/hosts /etc/hosts_bak/hosts_`date '+%Y%m%d'` 
gawk 'ARGIND==1{
        if($0 ~/^#/ || NF != 2){
                next ;
        }
        old_hosts[$2] = $1
    } 
    ARGIND==2{
        if($0 ~/^#/ || NF !=2 ){
            next ;
        }
        new_hosts[$2] = $1
    } END{
        for(host in old_hosts){
            if(host in new_hosts){
                print new_hosts[host] , host 
            }else{
                print old_hosts[host] , host
            }
        }

        for(host in new_hosts){
           if(!(host in old_hosts)){
               print new_hosts[host] , host
           }
        }        
}' /etc/hosts /tmp/hosts  > /etc/hosts
