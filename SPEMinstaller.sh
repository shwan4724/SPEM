#! /bin/bash
echo "SPEM(Shwan's Papermc Elastic Manager) installer"
echo "SPEM is still beta so it might have some bugs, and some funtions might be not working"
echo "you must be in sudoers to install SPEM"
echo "do you want to install SPEM? [y/n]"
read yesno
case $yesno in
    y)
        sudo mkdir SPEM
		cd ./SPEM
		
		sudo wget -O SPEM.sh https://raw.githubusercontent.com/shwan4724/SPEM/master/SPEM.sh?token=APEL5BTHYHVBO77T6E7L37S6VK4M4
		sudo chmod 755 SPEM.sh
		
		sudo 

		sudo mkdir SPAU
        sudo chmod 755 SPAU
        cd ./SPAU
        
        sudo wget -O SPAU.sh https://raw.githubusercontent.com/shwan4724/SPEM/master/SPAU.sh?token=APEL5BR7BRBXXANOXZH2GFS6VK4OS
        
        sudo touch paperpathraw
        sudo chmod 777 paperpathraw
        
        sudo touch paperpath
        sudo chmod 777 paperpath
        
        sudo touch versionhtml
        sudo chmod 777 versionhtml
        
        sudo touch version
        sudo chmod 777 version

		cd ..
		
		sudo mkdir SPAI
		cd ./SPAI

		sudo wget -O SPAI.sh https://raw.githubusercontent.com/shwan4724/SPEM/master/SPAI.sh?token=APEL5BWTL3UVWPI4IYDT2C26VK4QW
		sudo chmod 755 SPAI.sh

		sudo touch versionhtml
		sudo chmod 777 versionhtml

		sudo touch version
		sudo chmod 777 version


        
    n)
        echo "bye";;
        
esac
