PROJECTS="pynettool,python pyfly,python intoblack.github.com,python script-pool,sh cgame,c JargsParsr,Java pyregx,python sixgod,python xsearch,Java zoo-segment,python 
moodstyle,python js-cool,js pg-tool,python shell-pool,sh zoo-dict,python zoo-pool,Java proxy-tool,python pymongo,python"
BASE_PATH="/home/xxxx/github"
USERNAME=""
GITHUB="git@github.com:$USERNAME"

for project in $PROJECTS;do 
    dest=$(echo "$project" | cut -d ","  -f2)
    project_name=$(echo $project | cut -d "," -f1)
    echo "$dest $project_name"
    if [ -z "$dest" -o -z "$project_name" ];then
    	echo "$project  格式错误!"
    	continue
    fi
    mkdir -p $BASE_PATH/$dest
    if [ -d $BASE_PATH/$dest/$project_name ];then
    	echo "pulling $dest/$project_name ......"
    	cd $BASE_PATH/$dest/$project_name 
    	git pull origin master > /dev/null
    else
    	echo "cloning $dest/$project_name"
    	cd $BASE_PATH/$dest
    	git clone $GITHUB/$project_name".git" > /dev/null
    fi
    cd $BASE_PATH
done 
