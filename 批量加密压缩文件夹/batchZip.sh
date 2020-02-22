#!/bin/bash

rootDirNum=$#   ## 参数数量
argumentsStr=$*     ## 参数字符串，以空格隔开
dirsArray=(${argumentsStr// / })    ## 将参数转化为数组

# 进入当前执行文件所在的文件目录
currentFile=$0
currentDir=${currentFile%/*}    ## 获取最后一个"/"之前的字符串

index=0
while(( $index<$rootDirNum ))
do
    dirName=${dirsArray[$index]}
    index=`expr $index+1`
    source $currentDir/zipEncrpy.sh $dirName
done
echo "dirsArray 数组元素个数为: ${#dirsArray[*]}"
