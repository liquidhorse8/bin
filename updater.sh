#!/bin/bash

<<out

@ インストール後にやるべきこと
ipアドレスの固定
ショートカットキーの設定
ディレクトリ英語化  $HOME/.conf/userdirs.dir
chromeログイン
sambaユーザー追加
自動起動(conky設定)
visudo →  hoge ALL=NOPASSWD:  mount,umount
時計設定カスタム %Y/%m/%d %A %H:%M:%S
外観設定
ミュート:amixer -D pulse set Master 1+ toggle
音量アップ:amixer -D pulse set Master 1%+

out

# aptリポジトリ
sudo add-apt-repository ppa:ondrej/php
sudo add-apt-repository -y ppa:ppsspp/stable
sudo add-apt-repository ppa:xubuntu-dev/staging    # thunarバージョンアップ用
sudo apt update
# aptパッケージ
sudo apt install  chromium-browser chromium-browser-l10n git emacs vlc ffmpeg   nkf samba unar youtube-dl gthumb xautomation conky conky-all tumbler ffmpegthumbnailer ffmpegthumbs vlc-l10n vlc-plugin-samba cifs-utils curl gparted tumbler-plugins-extra  eyed3 gimp terminator kid3 ppsspp
# python
sudo apt install python3-pip python-pip python-gtk2
# php
sudo apt install php7.2 php7.2-common php7.2-cli php7.2-fpm php7.2-mysql php7.2-dev php7.2-mbstring php7.2-zip  php-elisp php5.6-mysql php5.6-mysql
sudo apt-get install apache2 mysql-server libapache2-mod-php
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# VLCでISOの再生
sudo apt install libdvd-pkg;sudo dpkg-reconfigure libdvd-pkg

<<out 
@バックアップ

$HOME/.bashrc
$HOME/.Xmodmap
$HOME/.config/user-dirs.dirs
/etc/samba/smb.conf
$HOME/documents
$HOME/.emacs.d
$HOME/.config/xfce4/
$HOME/.local/share/applications

out
