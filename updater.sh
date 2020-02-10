#!/bin/bash

<<out

@ インストール後にやるべきこと
ipアドレスの固定
ショートカットキーの設定
ディレクトリ英語化  $HOME/.conf/userdirs.dir
chromeログイン
sambaユーザー追加
自動起動(conky設定)
visudo→hoge ALL=NOPASSWD:  mount,umount
時計設定カスタム %Y/%m/%d %A %H:%M
外観設定
ミュート:amixer -D pulse set Master 1+ toggle
音量アップ:amixer -D pulse set Master 1%+

out

# aptリポジトリ
sudo add-apt-repository ppa:nijel/phpmyadmin
# aptパッケージ
sudo apt install  chromium-browser chromium-browser-l10n emacs vlc ffmpeg  python3-pip python-pip python-gtk2 python- nkf samba unar youtube-dl gthumb xautomation conky conky-all tumbler  php-elisp vlc-l10n vlc-plugin-samba cifs-utils curl gparted tumbler-plugins-extra  eyed3 gimp git
# VLCでISOの再生
sudo apt install libdvd-pkg;sudo dpkg-reconfigure libdvd-pkg

<<out バックアップ

$HOME/.bashrc
$HOME/.Xmodmap
$HOME/.config/user-dirs.dirs
/etc/samba/smb.conf
$HOME/documents
$HOME/.emacs.d
$HOME/.config/xfce4/
$HOME/.local/share/applications

out
