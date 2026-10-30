#!/bin/bash
# set -x
echo '!!!!!! start clone !!!!!!'

spdlog_path='spdlog'
rm -rf $spdlog_path
{ 
    git clone git@github.com:gabime/spdlog.git $spdlog_path
} && {
    echo '!!!!!! clone success !!!!!!'
}


if [ $# -eq 1 ]; then #没有参数就是编译latest
    psuhd -d $spdlog_path
    git checkout $1
    popd 
fi