#!/bin/bash
var1=$1

# Java Compile and Execute Shell
# chmod +x juice.shで実行権限を与える
# ./juice.shで実行可能

if [ "$var1" == "" ]; then
    echo "No input file"
# -f オプションを検知したら強制的にコンパイルと実行を行う
elif [ "$var1" == "-f" ]; then
    echo "Recognized option f"
    echo "-------------------"
    var2=$2
    # name=${var2%.*}
    javac ${var2%.*}.java && java ${var2%.*}
# オプション無しならclassが存在するか確認して、あるならclassのみを実行
elif [ -f "${var1%.*}.class" ]; then
    echo ".class already exists"
    echo "---------------------"
    java ${var1%.*}
# classがないならコンパイルと実行を行う
else
    echo ".class does not exist"
    echo "---------------------"
    javac ${var1%.*}.java && java ${var1%.*}
fi