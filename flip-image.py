#!/usr/bin/env python
#coding=utf-8
from PIL import Image
import sys
import os

path = os.getcwd() + "/"
list = []

#もし引数がひとつあれば
if( len( sys.argv ) == 2 ):
    #その引数をパスとする
    path = sys.argv[1]

files = os.listdir( path )
for i in files:
    if((".jpg"in i) == True or (".jpeg"in i) == True or (".png"in i) == True):
        list.append(i)

num = str(len(list))
i = 1
for img in list:
    im = Image.open(path+img)
    im = im.transpose(Image.FLIP_LEFT_RIGHT)
    im.save(path+img , quality = 90 )
    print img+":"+str(i)+"/"+num
    i += 1
