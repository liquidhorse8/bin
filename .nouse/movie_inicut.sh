#!/bin/bash
#動画冒頭を$1秒消すスクリプト

IFS_BACKUP=$IFS
IFS=$'\n'

if test $# -eq 0;then
    echo "引数がないので終了する"
    exit
fi

# -------------------------------mp4------------------------------------
count_mp4=$(ls|grep mp4|wc -l)
array_mp4=()
for i in `seq 1 $count_mp4`
do
    name=$(ls|grep mp4|head -$i | tail -1)
    array_mp4[$i]=$name
done
#MP4変換
for i in `seq 1 $count_mp4`
do
    name=${array_mp4[$i]}
    #名前から.mp4を抜き取る
    string=$(echo $name|sed "s/.mp4//")
    echo $string
    outname=$string"_out.mp4"
  
    ffmpeg -i "$name" -ss "$1" -c:v copy -c:a copy -async 1 -strict -2 "$outname"
    rm $name
done
# -------------------------------avi-----------------------------------
count_avi=$(ls|grep avi|wc -l)
array_avi=()
for i in `seq 1 $count_avi`
do
    name=$(ls|grep avi|head -$i | tail -1)
    array_avi[$i]=$name
done
#AVI変換
for i in `seq 1 $count_avi`
do
    name=${array_avi[$i]}
    #名前から.aviを抜き取る
    string=$(echo $name|sed "s/.avi//")
    echo $string
    outname=$string"_out.avi"
  
    ffmpeg -i "$name" -ss "$1" -c:v copy -c:a copy -async 1 -strict -2 "$outname"
    rm $name
done
# -------------------------------mp3-----------------------------------
count_mp3=$(ls|grep mp3|wc -l)
array_mp3=()
for i in `seq 1 $count_mp3`
do
    name=$(ls|grep mp3|head -$i | tail -1)
    array_mp3[$i]=$name
done
#mp3変換
for i in `seq 1 $count_mp3`
do
    name=${array_mp3[$i]}
    #名前から.mp3を抜き取る
    string=$(echo $name|sed "s/.mp3//")
    echo $string
    outname=$string"_out.mp3"
  
    ffmpeg -i "$name" -ss "$1" -c:a copy -async 1 -strict -2 "$outname"
    rm $name
done

IFS=$IFS_BACKUP
