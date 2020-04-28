#! /bin/bash
echo "This is SPEM(Shwan's Papermc Elastic Managment program)"
echo "You must be in sudoers to run this program"
echo "You can choose the tool to managment Papermc."
echo "   "
echo "1.SPAI(Shwan's Papermc Auto Installer)"
echo "2.SPAU(Shwan's Papermc Auto Updater)"
echo "choose program you want to run"
read pselect [1/2]
while :; do
	case $pselect in
		1)
			break;;
		2)
			break;;
		*)
			
	esac
	echo "please type 1 or 2"
	echo "choose program you want to run"
	read pselect
done

./"$pselect"/"$pselect".sh
