FROM centos:7.2.1511

# Node.jsをインストール
# NodeSource Node.js Binary Distributions
# https://github.com/nodesource/distributions/blob/master/README.md#deb
RUN curl -sL https://rpm.nodesource.com/setup_12.x | bash -
RUN yum install -y nodejs

# Puppeteerを実行するために不足しているモジュールをインストール
# Chrome headless doesn't launch on UNIX
# https://github.com/puppeteer/puppeteer/blob/master/docs/troubleshooting.md#chrome-headless-doesnt-launch-on-unix
RUN yum install -y pango.x86_64 \
libXcomposite.x86_64 \
libXcursor.x86_64 \
libXdamage.x86_64 \
libXext.x86_64 \
libXi.x86_64 \
libXtst.x86_64 \
cups-libs.x86_64 \
libXScrnSaver.x86_64 \
libXrandr.x86_64 \
GConf2.x86_64 \
alsa-lib.x86_64 \
atk.x86_64 \
gtk3.x86_64 \
ipa-gothic-fonts \
xorg-x11-fonts-100dpi \
xorg-x11-fonts-75dpi \
xorg-x11-utils \
xorg-x11-fonts-cyrillic \
xorg-x11-fonts-Type1 \
xorg-x11-fonts-misc

# puppeteer実行時に発生する以下のエラーを解消するためNSSを更新する
# /lib64/libnss3.so: version `NSS_3.22' not found (required by /home/chromium/727972/chrome-linux/chrome)
RUN yum update nss -y

# 以降の工程で必要なモジュールをインストール
RUN yum install -y git unzip

# PuppeteerをインストールするときChromiumをインストールしないようにする
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

# グローバルインストールしたnpmモジュールをrequireするときに参照するパスを変更
# デフォルトは/node_modules
ENV NODE_PATH /usr/lib/node_modules

# lazyimages_without_scroll_events.jsを実行するために必要なモジュールをインストール
RUN npm install -g puppeteer pixel-diff pngjs resize-img yargs
