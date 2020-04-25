#! /bin/bash

echo "Welcome to SPAU(Shwan's Papermc Auto Updater). This program will update your papermc jar file to latest version."
echo "SPAU will automaticly find the latest version of papermc jar file"
echo "You must be in sudoers to run this program."

user=`whoami`
sudo find / -xdev -name paper-* > paperpathraw
sudo cut  -b1- paperpathraw > paperpath
paperpath="`cat paperpath`"
sudo cat paperpath | rev > paperpathrev
paperpath4wget=` cut paperpathrev -b14- | rev`

curl 'https://papermc.io/ci/job/Paper-1.15/api/json?tree=builds\[number,url,artifacts\[fileName,relativePath\],timestamp,changeSet\[items\[comment,commitId,msg\]\]\]\{,10\}' -H 'authority: papermc.io' -H 'user-agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36' -H 'sec-fetch-dest: empty' -H 'accept: */*' -H 'sec-fetch-site: same-origin' -H 'sec-fetch-mode: cors' -H 'referer: https://papermc.io/downloads' -H 'accept-language: ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7' -H 'cookie: __cfduid=d87b1e9c6f3373f75884bfd64c09182641586519963; _ga=GA1.2.1676389007.1586521694; cookieconsent_status=allow; _gid=GA1.2.187790148.1586690965; _gat_gtag_UA_126555192_1=1' --compressed > versionhtml
cut -b132-134 versionhtml > version
version=`cat version`

echo $paperpath
echo $paperpath4wget

echo "Do you want to update papermc to version "$version"?[y/n]"
echo "If you want to exit the program, type q"
read yesno

while :; do
    case $yesno in
    [yn]) 
        break;;
    q)
        exit 0;;
    esac
    
    echo "please type y, n, or q"
    echo "Do you want to update papermc to version "$version"?[y/n]"
    echo "If you want to exit the program, type q"
    read yesno
    
done


case $yesno in
    y)
        sudo wget -O "$paperpath4wget"paper-"$version".jar https://papermc.io/api/v1/paper/1.15.2/"$version"/download
        sudo chown $user:$user "$paperpath4wget"/paper-"$version".jar
	sudo chmod 777 "$paperpath4wget"paper-"$version".jar
        sudo rm -rf $paperpath
        sudo printf "#! /bin/bash\njava -Xmx2048M -Xms1024M -jar paper-"$version".jar -nogui" > "$paperpath4wget"start.sh
        echo "update complete";;
    n)
        while :; do
        echo "If you want to select another version? [y/n]"
        read yesno
        case $yesno in
            y)
                echo "What version do you want to install?"
                read verison
                break;;
            n)
                while :; do
                echo "So... you want to install version "$verison". Right?[y/n]"
		read yesno
                    case $yesno in
                        y)
                            break;;
                        n)
                            echo "What version do you want to install?"
                            read verison;;
                        q)
                            exit 0;;
                        *)
                            echo "Please type y, n, or q";;
                    esac
                done
                sudo wget -O "$paperpath4wget"paper-"$version".jar https://papermc.io/api/v1/paper/1.15.2/"$version"/downloads
                sudo chown $user:$user "$paperpath4wget"paper-"$version".jar
		sudo chmod 777 "$paperpath4wget"paper-"$version".jar
                sudo rm -rf $paperpath
                sudo printf "#! /bin/bash\njava -Xmx2048M -Xms1024M -jar paper-"$version".jar -nogui" > "$paperpath4wget"start.sh
                echo "update complete";;
            q)
                exit 0;;
        esac
        done;;
esac
