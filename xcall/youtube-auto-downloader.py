#!/usr/bin/env python3
import requests
import re
import youtube_dl
#    Youtubeの再生リストから音楽をDLするアプリ
#    pip3 install youtube_dl
youtube = "https://www.youtube.com"
url = [ "https://www.youtube.com/playlist?list=PL17wzDjTZ76h9kczQuHmVMP5EPE1qAqzE" , "https://www.youtube.com/playlist?list=PL17wzDjTZ76hPa9No22L2_IXfT1Y8kIDx" ]
name = [ "邦楽系" , "洋楽系" ]

def test( url , num ):
    r = requests.get(url)
    tmp = re.findall( r"\/watch\?v=[!-~]{11}" , r.text )
    tmp = (list(set(tmp)))
    print( name[num] )
    for i in tmp:
        source_url = youtube + i ; print( source_url )
        with open( ".youtube-download-list" , "r" ) as filea:
            text = filea.read()
        if( source_url in text ):
            print("urlが存在するためスキップ")
            continue
        else:
            with open( ".youtube-download-list" , "a" ) as fileb:
                fileb.write( source_url + "\n" )
            
        options = {
            'writethumbnail': True,
            "format" : "bestaudio/best" ,
            "outtmpl" : "/home/f-wisdom/music/" + name[num] + "/%(title)s.%(ext)s",
            "postprocessors" : [
                { "key" : "FFmpegExtractAudio",
                  "preferredcodec" : "mp3",
                  "preferredquality" : "192"},
                {'key': 'EmbedThumbnail'},
            ],
        }
        ydl = youtube_dl.YoutubeDL( options )
        info_dict = ydl.extract_info( source_url , download=True )

for i in range( len( url ) ):
    test( url[i] , i )
print("End!")
