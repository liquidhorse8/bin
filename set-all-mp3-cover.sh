#!/bin/bash
#mp3に第一引数名($1)のjpg画像をセット

#IFS環境変数をバックアップ
IFS_BACKUP=$IFS
#IFSを改行区切りにする
IFS=$'\n'

#mp3をディレクトリ内から調べリスト化
count1=$(ls|grep mp3|wc -l)
for i in `seq 1 $count1`
do
    #名前を割り出す
    name=$(ls|grep mp3|head -$i | tail -1)
    echo $name

    #mp3の画像を消す
    eyeD3 --add-image=:FRONT_COVER $name

    #mp3に画像をセット
    eyeD3 --add-image=$1:FRONT_COVER $name
done
