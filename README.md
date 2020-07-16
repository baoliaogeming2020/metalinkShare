本项目所有文档为郭先生音频，通过支持 metalink 协议的下载软件下载音频，可以帮助向墙内战友传播。

<b>原理::</b>

metalink 下载协议支持 HTTP / FTP / Bittorrent 同时下载同一个文件，墙外战友在下载时可以通过Bittorrent向墙内分享流量，墙外战友下载同一个文件人数越多，墙内战友下载速度赶快。

metalink 是 xml 文件，内含相同文件的 HTTP / FTP / Bittorrent 链接，Bittorrent 以 btih 加密 hash 方式写入，而此 btih-hash 与 magnet-btih 完全相同，这样，墙外战友下载后可以直接将 btih-hash 构造成 magnet 文本后向墙内战友传播，墙内战友直接可以下载。而 magnet 首先会下载一个 Bittorrent 种子，然后可以通过所有 Bittorrent 软件进行下载。GFW 是无法完全封锁 Bittorrent 软件的 tracker 服务器的。

tracker 服务器网站::

https://newtrackon.com/list

DHT.dat下载::

https://github.com/P3TERX/aria2.conf

支持 metalink 软件汇总::

aria2:是一款自由、跨平台命令行下载管理器，支持的下载协议有：HTTP / HTTPS / FTP / Bittorrent / Metalink。无 shell 基础战友不建议使用。
AriaNg:
aria2webui:
yaaw:

本项目文件发布::

本网站发布郭先生音频文件同时发布同文件名的 torrent / metalink / magnet 三种下载链接，墙外战友下载时尽量不要用 HTTPS 模式下载，因为只有后三种模式能向墙内战友提供流量。

声明::

本项目为穿墙模式的一种试探，所有方法与技术实现不向爆料革命战友保留版权，任何爆料革命战友都可以用相同的方式传播爆料革命。如果有战友能够将此方法转为一键脚本，最好能与本项目作者沟通，因项目还在一步步完善。

MAC系统指生成::







