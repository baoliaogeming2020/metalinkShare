#! /bin/zsh

# 本脚本用于单文件生成metalink，将结果输出到标准输出(打印屏幕)。
# 需要修改变量 gitHubLink / description / generator
# gitHubLink : 当你上传音视频文件到github时，会生成一个链接，此变量只写绝对路径
# description : 对单个音视频文件的文字描述
# generator : 发布人，标明发布音视频的机构或个人
# 单文件用法：chmod 777 mkmetalink.sh; ./mkmetalink.sh dir/to/file
# 文件夹用法：absolutePath="absolute/path/of/folder"; for line in $(ls $absolutePath); do echo $absolutePath"/"$line; ./mkmetalink.sh $absolutePath"/"$line; done;

# 我的Github文件下载目录：https://raw.githubusercontent.com/baoliaogeming2020/audio/master/
# 我的sourceforge文件下载目录：https://svwh.dl.sourceforge.net/project/guide4me/milesaudio/
# "svwh"是三级目录，可以用以下三级目录替换，或者全部写入多个<url>...</url>，这样下载速度更快
# sourceforge下载的三级目录：liquidtelecom/excellmedia/jaist/nchc/netix/netcologne/freefr/kent/vorboss/astuteinternet/iweb/10gbps-io/ayera/cfhcable/cytranet/downloads.sourceforge.net/gigenet/newcontinuum/phoenixnap/pilotfiber/superb-dca2/svwh/versaweb/razaoinfo/ufpr

fileName=$1
baseName=$(basename $fileName)
dirName=$(dirname $fileName)
BTName=$fileName".torrent"
MTName=$fileName".metalink"
MGname=$fileName".magnet"

metalinkFormat=$(cat <<EOF
<?xml version="1.0" encoding="utf-8"?>
<metalink xmlns="urn:ietf:params:xml:ns:metalink">
	<origin dynamic="false">_http_link_</origin>
	<generator>_generator_</generator>
	<published>_published_</published>
	<file name="_file_name_">
		<description>_description_</description>
		<size>_size_</size>
		<hash type="md5">_hash__md5</hash>
		<hash type="btih">_hash_btih_</hash>
		<hash type="sha-256">_hash_sha256_</hash>
		<url location="" priority="30">_http_link_</url>
		<metaurl mediatype="torrent" priority="2">_torrent_link_</metaurl>
		<metaurl mediatype="magnet" priority="2">_magnet_link_</metaurl>
	</file>
</metalink>
EOF
)

gitHubLink="https://raw.githubusercontent.com/baoliaogeming2020/audio/master/"
SFLink="https://svwh.dl.sourceforge.net/project/guide4me/milesaudio/"

# httpLink=$gitHubLink$baseName
httpLink=$SFLink$baseName
BTLink=$httpLink".torrent"
MTLink=$httpLink".metalink"
generator="BaodLiaoGeMing2020"
published=$(date "+%Y-%m-%dT%H:%M:%SZ")
description="未写入文件描述"
fileSize=$(ls -l $fileName | awk '{print $5}')
hashMD5=$(md5 $fileName | awk '{print $4}')
hashSHA256=$(shasum $fileName | awk '{print $1}')

mktorrent -o $BTName $fileName 1>/dev/null && magnetLink=$(aria2c -S $BTName | awk '/Magnet URI:/{gsub("Magnet URI: ","");print}')

hashBTIH=$(echo $magnetLink | awk '{gsub(/magnet.+btih:/,"");gsub(/&.+/,"");print}')

metalinkFormat=${metalinkFormat//"_http_link_"/$httpLink}
metalinkFormat=${metalinkFormat//"_generator_"/$generator}
metalinkFormat=${metalinkFormat//"_published_"/$published}
metalinkFormat=${metalinkFormat//"_file_name_"/$baseName}
metalinkFormat=${metalinkFormat//"_description_"/$description}
metalinkFormat=${metalinkFormat//"_size_"/$fileSize}
metalinkFormat=${metalinkFormat//"_hash__md5"/$hashMD5}
metalinkFormat=${metalinkFormat//"_hash_btih_"/$hashBTIH}
metalinkFormat=${metalinkFormat//"_hash_sha256_"/$hashSHA256}
metalinkFormat=${metalinkFormat//"_torrent_link_"/$BTLink}
metalinkFormat=${metalinkFormat//"_magnet_link_"/$magnetLink}

echo ${metalinkFormat//"_http_link_"/$gitHubLink} > $MTName
echo $magnetLink > $MGname

echo $MTLink >> downloadLink.txt
echo $magnetLink >> downloadLink.txt
echo "" >> downloadLink.txt
