#!/bin/bash

#### 将指定的文件夹下的文件夹加密为对应的zip文件
#### 如：aaa文件夹下有d1、d2和d3三个文件夹，则如下命令将生产d1.zip、d2.zip和d3.zip三个文件
#### zipEncrpy.sh aaa

root_dir=$1
cd $root_dir
echo $root_dir

echo "begin zip directory...."

for file in *; do
    na=$(echo "$file" | tr ' ' '_')     ### 将文件名中的空格转化为_
    if [[ $file != $na ]]; then
        mv "$file" $na
    fi
    if [ -d "$na" ]; then       ### 如果是文件夹
        if [ ! -f "$file.zip" ]; then
            zip -r $file.zip $file/**/{*.JPG,*.jpg,*.PNG,*.png,*.MOV,*.mp4,*.MP4,*.mov} -P 密码
        fi
    fi
done

echo "end zip directory"
