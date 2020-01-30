#!/usr/bin/env python
#coding:utf-8
from PIL import Image
import sys
import os

list = []
path = os.getcwd() + "/"

#もし引数がひとつあれば
if( len(sys.argv) > 2 ):
    #その引数をパスとする
    path = sys.argv[1]

files = os.listdir(path)
for i in files:
    if((".png" in i)==True or (".bmp" in i)==True or (".gif" in i)==True ):
        list.append(i)
list.sort()
print "変換数:"+str(len(list))
num = 1

for pic in list:
    raw_name = pic[0:len(pic)-4]
    if(os.path.exists(path+raw_name+".jpg")==False):
        print str(num)+":"+raw_name+".jpg"
        #pngをjpgに
        #イメージオブジェクトを作成
        im = Image.open(path+pic)
        #RGBモードにする
        im = im.convert("RGB")
        im.save(path+raw_name+".jpg", quality=80)
        #png削除
        os.remove(path+pic)
    else:
        print raw_name+"すでに加工してある"
    num += 1

print "加工完了!"
