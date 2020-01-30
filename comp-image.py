#!/usr/bin/env python3
#coding:utf-8
#jpgを圧縮
from PIL import Image
import sys
import os

path = os.getcwd() + "/"
list = []

rate = 80
#もし引数がひとつあり、10より大きければ
if( len(sys.argv) == 2 and int(sys.argv[1]) > 10 ):
    #その引数を圧縮率にする
    rate = int( sys.argv[1] )

print(rate)

files = os.listdir(path)
for i in files:
    if((".jpg" in i)==True or (".jpeg" in i)==True or (".JPG" in i)==True):
        list.append(i)
list.sort()
print( "変換数:"+str(len(list)) )

num = 1
for pic in list:
    print( str(num) + "/" + str(len(list)) + " : " + pic )
    im = Image.open( path + pic )
    #im.save(path+pic, quality=80)
    im.save( path + pic , quality = rate )
    num += 1
