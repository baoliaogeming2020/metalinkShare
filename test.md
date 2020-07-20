本项目目的是通过 metalink 向墙内传播郭先生爆料革命音视频，当墙外战友通过 metalink 下载时，可向墙内战友分享下载流量。  
发布文件包括：音视频文件及同名 .torrent / .metalink / .magnet 文件。  
墙外战友通过 metalink 下载，墙内战友通过 torrent / magnet 下载。  
# 声明： #
本项目为穿墙模式试探，所有方法与技术实现不向爆料革命战友保留版权，任何爆料革命战友都可以用相同的方式传播爆料革命。  
如爆料革命主播想将音视频存储方式从 MEGA网盘转到此方式，以方便穿墙传播，本人可以提供全程技术支持，请在评论区留言。  
# 原理： #
metalink 协议支持 HTTP / FTP / Bittorrent 同时下载同一个文件，墙外战友在下载时可以通过 BT 向墙内分享流量，墙外战友下载人数越多，墙内速度越快。metalink 是 xml 文件，内含相同文件的 HTTP / FTP / Bittorrent 下载链接，BT 以 btih 加密 hash 方式写入，此 btih-hash 与 magnet-btih 完全相同，这样，墙外战友下载后可以直接将 btih-hash 构造成 magnet 文本后向墙内战友传播，墙内战友直接可以下载。而 magnet 首先会下载一个 Bittorrent 种子，然后可以通过所有 Bittorrent 软件进行下载。某些BT软件在下载 magnet 链接时找种慢，可以用迅雷(虽然有点危险)下载 magnet，这样找种快，然后再用其它BT软件下载此种子文件，_注意_，迅雷在指定下载文件夹内先下载种子，但种子是隐藏文件，要想看到种子需要打开文件夹的显示隐藏功能。  
GFW 是无法完全封锁 Bittorrent 软件的 tracker 服务器和 DHT 路由。  
# 传播方式： #
网上有大量免费空间，只要能够上传文件并生成 http / ftp 下载链接，有无域名都可以传播。本地用脚本批量生成torrent / metalink / magnet 三种文件，一并上传，然后向墙外分享 metalink 链接，向墙内分享 magnet链接。  
## Sourceforge传播方式示例： ##
[示例](https://sourceforge.net/projects/guide4me/)  
Sourceforge(SF)注册后建 project 可提供 1000M 空间，所有上传文件在无域名的情况下可生成下载链接，SF 有 20 多个[备用下载服务器](SF-dl-server.txt)，这些服务器的IP都不相同，也就是，你上传的每个文件会有20多个下载链接，很适合 metalink 下载加速。  
郭先生、路德、面具的音频基本上平均大小在 20M 左右，1000M 空间可以上传 50 个音频，大概是一个主播近两个月的内容，用 metalink 实现 http 向 BT 注入流量两个月已经可以完成做种分享。  
SF 支持 SCP / Rsync / SFTP / SSH 命令，可以实现一键脚本。  
有意思的事：大陆竟然没封锁SF网站。如果不会用metalink，可以直接上传音频，传播链接。  
## Github传播方式示例： ##
Github注册后建 project 可上传小于25M的文件，所有上传文件在无域名的情况下可生成下载链接。郭先生、路德、面具的音频中大于25M的要分割然后上传。  
### 分享方式示例： ###
墙外战友下载：  `aria2c https://github.com/baoliaogeming2020/audio/raw/master/20200625_Miles.mp3.metalink`  
墙内战友下载：  `aria2c magnet:?xt=urn:btih:A8C93686D09CAB35B04E648DAB805D2B9165E23E`  
# BT服务器： #
tracker 服务器网站：<https://newtrackon.com/list>  
DHT.dat 下载的网站：<https://github.com/P3TERX/aria2.conf>  
# 支持 metalink 软件汇总： #
aria2：是一款自由、跨平台命令行下载管理器，支持的下载协议有： HTTP / HTTPS / FTP / Bittorrent / Metalink。无 shell 基础战友不建议使用。  
AriaNg：  
aria2webui：  
yaaw：  
... ...  
# 支持 BT / magnet 软件汇总： #
Motrix：<https://motrix.app/>  
... ...  
# 本项目文件发布： #
本网站发布郭先生音频文件同时发布同文件名的 .torrent / .metalink / .magnet 三种下载链接，墙外战友下载时尽量不要用 https / torrent 模式下载，因为只有 metalink / magnet 能向墙内战友提供流量。  
向战友分享文件为[downloadLinkList.txt](downloadLinkList.txt)，此文件包括墙内墙外战友下载两种链接格式 .metalink 与 magnet 链接。  
# 如何参与分享 #  
在 sourceforge 申请账号，新建项目；将郭先生音视频下载到本地单独文件夹，下载本站[mkmetalink](mkmetalink.sh "现阶段，此脚本只适用MacOS，其它OS请等待")脚本，按此脚本注释执行后会在文件夹内生成每个文件的 .torrent .magnet .metalink 的同名文件，同时生成一个下载列表文件"downLoadList.txt"。下一步就是，把整个文件夹内文件上传到 SF，最后将"downLoadList.txt"文件向战友分享。  
如果自有网上空间的战友，需要修改"mkmetalink"脚本文件。
## MAC系统操作步骤： ##  
1. 安装 homebrew：  
`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`  
2. 安装aria2：  
`brew install aria2`  
3. 安装mktorrent：  
`brew insatll mktorrent`  
4. 执行metalink脚本：  
[脚本](mkmetalink.sh)  
\# 单文件用法：`chmod 777 mkmetalink.sh; ./mkmetalink.sh dir/to/file`  
\# 文件夹用法：`absolutePath="absolute/path/of/folder"; for line in $(ls $absolutePath); do echo $absolutePath"/"$line; ./mkmetalink.sh $absolutePath"/"$line; done;`  
## LINUX系统操作步骤： ##  
正在写，希望战友帮忙...  
## WINDOWS系统操作步骤： ##  
正在写，希望战友帮忙...  
# metalink 文件格式： #
参考文件[metalink-format.metalink](metalink-format.metalink)
