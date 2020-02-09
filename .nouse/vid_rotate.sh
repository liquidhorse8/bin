#!/bin/bash
# 動画を回転するスクリプト $1:動画ファイル $2:向き(r,l)

# 右
if test $2 = "r" ; then
    ffmpeg -i $1 -vf transpose=1 -metadata:s:v:0 rotate=0 out.mp4 ; fi
# 左
if test $2 = "l" ; then
    ffmpeg -i $1 -vf transpose=2 -metadata:s:v:0 rotate=0 out.mp4 ; fi
