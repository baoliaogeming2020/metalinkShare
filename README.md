本项目所有文档为郭先生音频，通过支持metalink协议的下载软件下载音频，可以帮助墙内战友。

原理：
metalink是xml文件，内含相同文件的 HTTP / FTP / Bittorrent 链接，Bittorrent以btih加密hash方式写入，而此 btih-hash 与 magnet-btih 完全相同，这样，墙外战友下载后可以直接将btih-hash构造成 magnet 文本后向墙内战友传播，墙内战友直接可以下载。而 magnet 首先会下载一个 Bittorrent 种子，然后可以通过所有 Bittorrent 软件进行下载。GFW 是无法完全封锁 Bittorrent 软件的 tracker 服务器的。

tracker服务器网站：
https://newtrackon.com/list

metalink下载协议支持HTTP / FTP / Bittorrent 同时下载同一个文件，墙外战友在下载时可以通过Bittorrent向墙内分享流量，墙外战友下载同一个文件人数越多，墙内战友下载速度赶快。

支持metalink软件汇总：
aria2:是一款自由、跨平台命令行下载管理器，支持的下载协议有：HTTP、HTTPS、FTP、Bittorrent 和 Metalink。
