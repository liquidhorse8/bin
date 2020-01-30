#!/bin/bash
#1:mp3、2:カバー画像

#IFS環境変数をバックアップ
IFS_BACKUP=$IFS
#IFSを改行区切りにする
IFS=$'\n'

#mp3の画像を消す
eyeD3 --add-image=:FRONT_COVER $1

#mp3に画像をセット
eyeD3 --add-image="$2":FRONT_COVER $1

#IFSを元に戻す
IFS=$IFS_BACKUP
