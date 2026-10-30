#可以在jenkinsfile中直接调用
echo '!!!!!! start build !!!!!!'
spdlog_path='spdlog'

pushd -d $spdlog_path
    mkdir build
    pushd build
        cmake ..
        make 
    popd
popd 