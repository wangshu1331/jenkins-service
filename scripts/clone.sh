#!/bin/bash
# set -x
echo '!!!!!! start clone !!!!!!'

spdlog_path='spdlog'
rm -rf $spdlog_path
{ 
    git clone https://github.com/gabime/spdlog.git $spdlog_path
} && {
    echo '!!!!!! clone success !!!!!!'
    if [ $# -eq 1 ]; then 
        pushd -d $spdlog_path
            git checkout $1
        popd 
    fi
}


