<pre>
本项目目的是通过 metalink 向墙内传播郭先生爆料革命音视频，通过支持 metalink 协议的下载软件下载音频，
可以帮助向墙内战友传播。发布文件包括：音视频文件及同名 .torrent / .metalink / .magnet 文件，墙外
战友用 metalink 下载能向墙内 torrent / magnet 下载的战友补充流量。
</pre>

<b>声明：</b>
<pre>
本项目为穿墙模式的一种试探，所有方法与技术实现不向爆料革命战友保留版权，任何爆料革命战友都可以用相同的方
式传播爆料革命。如果有战友能够将此方法转为一键脚本，最好能与本项目作者沟通，因项目还在进一步完善。如有爆
料革命主播想将音视频存储方式从MEGA网盘转到此方式，以方便穿墙传播，本人可以提供全程技术支持，请在评论区留
言。
</pre>

<b>原理：</b>
<pre>
metalink 下载协议支持 HTTP / FTP / Bittorrent 同时下载同一个文件，墙外战友在下载时可以通过BT向墙
内分享流量，墙外战友下载同一个文件人数越多，墙内战友下载速度越快。 metalink 是 xml 文件，内含相同文件
的 HTTP / FTP / Bittorrent 链接，BT 以 btih 加密 hash 方式写入，此 btih-hash 与 magnet-btih 
完全相同，这样，墙外战友下载后可以直接将 btih-hash 构造成 magnet 文本后向墙内战友传播，墙内战友直接
可以下载。而 magnet 首先会下载一个 Bittorrent 种子，然后可以通过所有 Bittorrent 软件进行下载。某些
BT软件在下载 magnet 链接时找到种子需要时间较长，可以用迅雷(虽然有点危险)下载 magnet，这样会获取种子，
迅雷获取种子的速度很快，然后再用其它BT软件下载此种子文件，注意，在各操作系统上种子一般都是隐藏文件，要想
看到种子需要打开文件夹的显示隐藏功能。GFW 是无法完全封锁 Bittorrent 软件的 tracker 服务器和 DHT 路由。
</pre>

<b>传播方式：</b>
<pre>
网上有好多免费空间，只要能够上传文件并生成 http / ftp 下载链接，有无域名都可以传播。本地用脚本批量生成
torrent / metalink / magnet 三种文件，一并上传，然后向墙外分享 metalink 链接，向墙内分享 magnet
链接。
</pre>

<b>Sourceforge传播方式示例：</b>
<pre>
https://sourceforge.net/projects/guide4me/
Sourceforge(SF)注册后建 project 可提供 1000M 空间，所有上传文件在无域名的情况下可生成下载链接，SF
有 20 多个<a href="SF-dl-server.txt">备用下载服务器</a>，这些服务器的IP都是不同的，也就是，你上传的每个文件会有20多个下载链接，很适合
metalink 下载加速。郭先生、路德、面具的音频基本上平均大小在 20M 左右，1000M 空间可以上传 50 个音频，
大概是一个主播近两个月的内容，用 metalink 实现 http 向 BT 注入流量两个月已经可以完成做种分享。
SF 支持 SCP / Rsync / SFTP / SSH命令，可以实现一键脚本。
有意思的事：大陆竟然没封锁SF网站。如果不会用metalink，可以直接上传音频，传播链接。
</pre>

<b>Github传播方式示例：</b>
<pre>
Github注册后建 project 可上传小于25M的文件，所有上传文件在无域名的情况下可生成下载链接。
郭先生、路德、面具的音频中大于25M的要分割然后上传。
分享方式示例：
<pre>
墙外战友下载：aria2c https://github.com/baoliaogeming2020/audio/raw/master/20200625_Miles.mp3.metalink 
墙内战友下载：aria2c magnet:?xt=urn:btih:A8C93686D09CAB35B04E648DAB805D2B9165E23E
</pre>
</pre>

<b>BT服务器：</b>
<pre>
tracker 服务器网站：https://newtrackon.com/list
DHT.dat 下载的网站：https://github.com/P3TERX/aria2.conf
</pre>

<b>支持 metalink 软件汇总：</b>
<pre>
aria2： 是一款自由、跨平台命令行下载管理器，支持的下载协议有： HTTP / HTTPS / FTP / Bittorrent / 
Metalink。无 shell 基础战友不建议使用。
AriaNg：
aria2webui：
yaaw：
... ...
</pre>

<b>支持 BT / magnet 软件汇总：</b>
<pre>
Motrix：https://motrix.app/
... ...
</pre>

<b>本项目文件发布：</b>
<pre>
本网站发布郭先生音频文件同时发布同文件名的 torrent / metalink / magnet 三种下载链接，墙外战友下载时
尽量不要用 HTTPS / torrent 模式下载，因为只有 metalink / magnet 能向墙内战友提供流量。
</pre>

<b>MAC系统批量生成：</b>(正在准备一键指脚本，以下为脚本基本命令)
<pre>
1. 安装 homebrew：
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
2. 安装aria2：
	brew install aria2
3. 安装mktorrent：
	brew insatll mktorrent
4. 生成torrent：
	mktorrent input_file
5. 生成magnet：
	aria2c -S input_file.torrent
6. 生成metalink：
	<a href="mkmetalink.sh">生成脚本</a>
	# 单文件用法：chmod 777 mkmetalink.sh; ./mkmetalink.sh dir/to/file
	# 文件夹用法：absolutePath="absolute/path/of/folder"; for line in $(ls $absolutePath); do echo $absolutePath"/"$line; ./mkmetalink.sh $absolutePath"/"$line; done;
</pre>

<b>metalink 文件格式：</b>
<pre>
参考文件<a href="metalink-format.metalink">metalink-format.metalink</a>
</pre>
