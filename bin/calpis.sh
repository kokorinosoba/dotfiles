#!/bin/bash
var1=$1

# C++ Compile and Execute Shell
# chmod +x calpis.shで実行権限を与える
# ./calpis.shで実行可能

if [ "$var1" == "" ]; then
    echo "No input file"
# -f オプションを検知したら強制的にコンパイルと実行を行う
elif [ "$var1" == "-f" ]; then
    echo "Recognized option f"
    echo "-------------------"
    var2=$2
    # name=${var2%.*}
    c++ $var2 -o ${var2%.*}.o && ./${var2%.*}.o
# オプション無しなら.oが存在するか確認して、あるなら.oのみを実行
elif [ -f "${var1%.*}.o" ]; then
    echo ".o already exists"
    echo "-----------------"
    ./${var1%.*}.o
# .oがないならコンパイルと実行を行う
else
    echo ".o does not exist"
    echo "-----------------"
    c++ $var1 -o ${var1%.*}.o && ./${var1%.*}.o
fi
