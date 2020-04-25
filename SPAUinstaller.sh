#! /bin/bash
echo "SPAU(Shwan's Papermc Auto Updater) installer verson"
echo "SPAU is still beta so it might have some bugs, and some funtions might be not working"
echo "you must be in sudoers to install SPAU"
echo "do you want to install SPAU? [y/n]"
read yesno
case $yesno in
    y)
        sudo mkdir SPAU
        sudo chmod 755 SPAU
        cd ./SPAU
        
        sudo wget -O SPAU.sh https://www.dropbox.com/s/1at8onptpqqomcu/SPAU.sh?dl=1
        
        sudo touch paperpathraw
        sudo chmod 777 paperpathraw
        
        sudo touch paperpath
        sudo chmod 777 paperpath
        
        sudo touch versionhtml
        sudo chmod 777 versionhtml
        
        sudo touch version
        sudo chmod 777 version;;
        
    n)
        echo "bye";;
        
esac
