本项目所有文档为郭先生音频，通过支持 metalink 协议的下载软件下载音频，可以帮助向墙内战友传播。

<b>声明::</b><br>
本项目为穿墙模式的一种试探，所有方法与技术实现不向爆料革命战友保留版权，任何爆料革命战友都可以用相同的方式传播爆料革命。如果有战友能够将此方法转为一键脚本，最好能与本项目作者沟通，因项目还在进一步完善。<br>
如有爆料革命主播想将音视频存储从MEGA网盘转到GitHub，以方便穿墙传播，本人可以提供全程技术支持，请在评论区留言。

<b>原理::</b><br>
metalink 下载协议支持 HTTP / FTP / Bittorrent 同时下载同一个文件，墙外战友在下载时可以通过Bittorrent向墙内分享流量，墙外战友下载同一个文件人数越多，墙内战友下载速度赶快。<br>
metalink 是 xml 文件，内含相同文件的 HTTP / FTP / Bittorrent 链接，Bittorrent 以 btih 加密 hash 方式写入，而此 btih-hash 与 magnet-btih 完全相同，这样，墙外战友下载后可以直接将 btih-hash 构造成 magnet 文本后向墙内战友传播，墙内战友直接可以下载。而 magnet 首先会下载一个 Bittorrent 种子，然后可以通过所有 Bittorrent 软件进行下载。GFW 是无法完全封锁 Bittorrent 软件的 tracker 服务器和 DHT 路由。

<b>下载方式::</b><br>
墙外战友下载：aria2c https://github.com/baoliaogeming2020/audio/raw/master/20200625_Miles.mp3.metalink <br>
墙内战友下载：aria2c magnet:?xt=urn:btih:A8C93686D09CAB35B04E648DAB805D2B9165E23E

<b>tracker 服务器网站::</b><br>
https://newtrackon.com/list

<b>DHT.dat下载::</b><br>
https://github.com/P3TERX/aria2.conf

<b>支持 metalink 软件汇总::</b><br>
aria2:是一款自由、跨平台命令行下载管理器，支持的下载协议有：HTTP / HTTPS / FTP / Bittorrent / Metalink。无 shell 基础战友不建议使用。<br>
AriaNg:<br>
aria2webui:<br>
yaaw:

<b>本项目文件发布::</b><br>
本网站发布郭先生音频文件同时发布同文件名的 torrent / metalink / magnet 三种下载链接，墙外战友下载时尽量不要用 HTTPS / torrent 模式下载，因为只有 metalink / magnet 能向墙内战友提供流量。

<b>MAC系统批量生成::</b>(正在准备一键指脚本，以下为脚本基本命令)<br>
1. 安装 homebrew:<br>
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
2. 安装aria2:<br>
brew install aria2
3. 安装mktorrent:<br>
brew insatll mktorrent
4. 生成torrent:<br>
mktorrent input_file
5. 生成magnet:<br>
aria2c -S input_file.torrent
6. 生成metalink:<br>
正准备写个脚本

<b>metalink 文件格式::</b><br>
参考文件<a href="metalink-format.metalink">metalink-format.metalink</a>
