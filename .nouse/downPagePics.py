#!/usr/bin/env python
#coding:utf-8
# サイト内の画像をダウンロードするプログラム
# 第二引数でhref以外の画像ダウンロード
import urllib2
from HTMLParser import HTMLParser
import sys
import os

path = "/home/moonlight/download/"

#画像をダウンロードして保存する関数
def image_download( img_url , title ):
    try:
        opener = urllib2.build_opener()
        req = urllib2.Request(img_url, headers={'User-Agent' : "Magic Browser"})
        img_file = open( path + title  , "wb")
        img_file.write(opener.open(req).read())
        img_file.close()
    except Exception,e:
        print e
        pics_src = None


class ImageParser(HTMLParser): # HTMLParserを継承したクラスを定義する

    def __init__( self ):
        HTMLParser.__init__(self)
        self.flag = False 
        self.piclists = []
 
    def handle_starttag(self, tag, attrs):
        attrs = dict( attrs )
        if tag == "a":
            try:
                if "jpg" in attrs["href"]:
                    self.piclists.append( attrs["href"] )
            except:
                pass
        if tag == "img":
            #print attrs["src"]
            # もし第二引数があればsrcからもダウンロード
            if(len(sys.argv) == 3):
                self.piclists.append( attrs["src"] )
        if tag == "title":
            self.flag = True
            
    def handle_data(self, data): # 要素内用を扱うためのメソッド
        if self.flag:
            self.title = data
            #print data
            self.flag = False

 
url = ""  #ダウンロードするURL
#コマンドライン引数をターゲットURLにする
if(len(sys.argv) < 2):
    sys.exit()

f = urllib2.urlopen( sys.argv[1].decode('utf-8') )
parser = ImageParser()        # パーサオブジェクトの生成
parser.feed( f.read().decode('utf-8') ) # パーサにHTMLを入力する
parser.close()
f.close()

print parser.title
#print parser.piclists

for i in parser.piclists:
    pictitle = i[i.rfind("/")+1:]
    print pictitle
    image_download( i , pictitle )
