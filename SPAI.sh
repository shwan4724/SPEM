#! /bin/bash
echo "This is SPAI(Shwan's Papermc Auto Installer)"
curl 'https://papermc.io/ci/job/Paper-1.15/api/json?tree=builds\[number,url,artifacts\[fileName,relativePath\],timestamp,changeSet\[items\[comment,commitId,msg\]\]\]\{,10\}' -H 'authority: papermc.io' -H 'user-agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36' -H 'sec-fetch-dest: empty' -H 'accept: */*' -H 'sec-fetch-site: same-origin' -H 'sec-fetch-mode: cors' -H 'referer: https://papermc.io/downloads' -H 'accept-language: ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7' -H 'cookie: __cfduid=d87b1e9c6f3373f75884bfd64c09182641586519963; _ga=GA1.2.1676389007.1586521694; cookieconsent_status=allow; _gid=GA1.2.187790148.1586690965; _gat_gtag_UA_126555192_1=1' --compressed > versionhtml

cut -b132-134 versionhtml > version
$version=`cat version`

echo "where do you want to install PaperMC?"
read paperpath

while :; do
	if [-d $paperpath]
		

done

cd "$paperpath"
sudo mkdir papermc
cd ./papermc

sudo wget -O paper-"$version".jar http://papermc.io/api/v1/paper/1.15.2/"$version"/download

java -Xmx1024M -Xms1024M -jar ./paper-"$version".jar -nogui

sudo printf "\b\b\b\b\btrue" >> ./eula.txt

java 
