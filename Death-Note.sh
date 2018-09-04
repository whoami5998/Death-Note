#!/bin/bash
###########
#
Work_dir=`pwd`
config_language="$Work_dir/Modules/configLanguage"
Metasploit_Config="$Work_dir/Modules/Metasploit/config"
dir_malware_tools="$Work_dir/Tools/Synthetic-Malware"
source install.sh
#
IP=`ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1 -d'/'`
WANIP=`dig +short myip.opendns.com @resolver1.opendns.com`  	
rm -rf $config_language
touch $config_language
resize -s 25 98 > /dev/null
clear
## Color ##
#
red='\e[31m'
white="\e[97m" #normal
RESET="\033[00m" #normal
######
#Banner
#
######

function Banner {
echo ""
echo ""
echo -e $red'	M"""""""YMM'${white}'                     dP   dP                              dP 		'           
echo -e $red"	M  ${white}mmmm.$red "'`'"M${white}                     88   88                              88            	"
echo -e $red"	M  ${white}MMMMM$red  M${white} .d8888b. .d8888b. d8888P 88d888b.    88d888b. .d8888b. d8888P .d8888b. 	"
echo -e $red"	M  ${white}MMMMM$red  M${white} 88ooood8 88'  "'`'"88   88   88'  "'`'"88    88'  "'`'"88 88'  "'`'"88   88   88ooood8 	"
echo -e $red"	M  ${white}MMMM'$red .M${white} 88.  ... 88.  .88   88   88    88    88    88 88.  .88   88   88.  ... 	"
echo -e $red"	M       .MM${white} "'`'"88888P' "'`'"88888P8   dP   dP    dP    dP    dP "'`'"88888P'   dP   "'`'"88888P' 	"
echo -e $red"	MMMMMMMMMMM${white}                                                                        	${RESET}"
echo -e "								Project's :${red} Ryuk-shinigami ${RESET}"
}
Banner
function language {
		
                echo -e " Select your language"
                echo  -e "     	 [ 1 ] VietNamese  "
		echo  -e "     	 [ 2 ] English "
		echo  -e "	 [ 3 ] Japanese "
		echo  -ne "           Choose :"
		while true; do                
		read yn
                case $yn in
                   1 )  echo "###########################" > $config_language
			echo 'language="VN"' >> $config_language 
			source $Work_dir/language/VietNamese/VN;
			source $Work_dir/language/VietNamese/vn_table;  break;;
                    * ) echo -e "		Unknown option. Please choose again";
					echo  -ne "           Choose :"
                esac
       		done
}
function order {
order_table
echo  -ne "$input_choose"
while true; do
	read parameter
	case $parameter in
		4 )
			echo "		$GenMess"
			echo "		2 ) Trojan,bonet,keylooger,virus,spyware..."
			echo "		99) $return_choose"	
			echo -ne "$input_choose"
			while true; do
			read parameter
			case $parameter in
					1 ) GenAndLis; break;;
					2 ) maware_tools; break;;
					99 ) clear; Banner; order; break;;
					* ) echo -e "$error1";
					echo  -ne "$input_choose";;
			esac
			done
			break;;
		6 )
			echo " 1) $WAchoose_option1 "
			echo " 2) $WAchoose_option2 "
			echo "99) $return_choose"
			echo  -ne "$input_choose"
			while true; do
			read parameter
			case $parameter in
					1 ) WiFiAttacks; break;;
					2 ) BluetoothAttacks; break;;
					99) clear; Banner; order; break;;
					* ) echo -e "$error1";
					echo  -ne "$input_choose";;
			esac
			done
			break;;
		8 )
			install_table
			echo  -ne "$input_choose"
			while true; do
			read parameter
			case $parameter in
				4) #cleanup;
				   ShowAndInstall_MalwareTools; clear; Banner; order; break;;
				6) #cleanup;
				   ShowAndInstall_WiFiTools; clear; Banner; order; break;;
				8)
				   add_module_metasploits; clear; Banner; order; break;;
				9) #cleanup;
				   ShowAndInstall_ALLTools; clear; Banner; order; break;;
			esac
			done
			break;;

		* ) echo  "$error1";
	esac
	echo  -ne "$input_choose"
	done
}
#####################################################################
function GenAndLis {
#
# Ngrok Tunnel - Port Forward
#
echo -e "[${red}*${RESET}] Thiết lập chế độ lắng nghe [${red}*${RESET}]"
Type_Li=$(zenity --list  --title "♛ Type Listerning ♛" --text "\nChose option:" --radiolist --column "Pick" --column "Option" TRUE "LAN listerning" FALSE "WAN listerning" FALSE "WAN listerning using NGROK" --width 300 --height 210 )
#
resize -s 31 104 > /dev/null 2>&1
gen_backdoor_table
	echo -ne "$Choose_Tools "
	while true; do
		read choose
		case $choose in
1)	###################### Dr0p1t-Framework ###########################
			cd $dir_malware_tools/Dr0p1t-Framework/
			python Dr0p1t.py; clear; Banner; order; break;;
2)	###################### DKMC ###########################
			cd $dir_malware_tools/DKMC/
			python dkmc.py; clear; Banner; order; break;;
3)	###################### TheFatRat ######################
			cd $dir_malware_tools/TheFatRat/
			./fatrat; clear; Banner; order; break;;
4) 	###################### msfpc ##########################	
			cd $Work_dir/Modules/Metasploit/
			rm config > /dev/null 2>&1
			touch config
			if [ "$Type_Li" = "WAN listerning using NGROK" ]; then	echo "WorkMode=3" > config
			elif [ "$Type_Li" = "WAN listerning" ]; then 	echo "WorkMode=2" > config
			else	echo "WorkMode=1" > config
			fi
			cd ../../$dir_malware_tools/mpc/
			./msfpc1.sh; clear; Banner; order; break;;
5)	###################### Winpayloads ###########################
			cd $dir_malware_tools/Winpayloads/
			python WinPayloads.py; clear; Banner; order; break;;
6)	###################### astroid ###########################
			echo "Tool này đang thử nghiệm chưa thể  biến dịch thành file exe, Sorry :V chọn tool khác đeeeee "; clear; Banner; order; break;;
7)	###################### phantom-evasion ###########################
			cd $dir_malware_tools/Phantom-Evasion/
			python phantom-evasion.py; clear; Banner; order; break;;
8)	###################### tophat ###########################
			cd $dir_malware_tools/TopHat/
			python tophat.py; clear; Banner; order; break;;
9) 	###################### MPM ##########################	
		  	cd $dir_malware_tools/Meterpreter_Paranoid_Mode-SSL/
			rm config > /dev/null 2>&1
			touch config
			echo "#########################################" > config
			if [ "$Type_Li" = "WAN listerning using NGROK" ]; then	echo "Working_mode=3" >> config
			elif [ "$Type_Li" = "WAN listerning" ]; then 	echo "Working_mode=2" >> config
			else	echo "Working_mode=1" >> config 
			fi
			./Meterpreter_Paranoid_Mode.sh; clear; Banner; order; break;;
10)	###################### venom ###########################
			cd $dir_malware_tools/venom/
			./venom.sh; clear; Banner; order; break;;
11)	###################### HERCULES ###########################
			cd $dir_malware_tools/HERCULES/
			HERCULES; clear; Banner; order; break;;
12) 	###################### zirikatu ##########################
		  	cd $dir_malware_tools/zirikatu/
			rm config > /dev/null 2>&1
			touch config
			echo "#########################################" > config
			if [ "$Type_Li" = "WAN listerning using NGROK" ]; then	echo "Working_mode=3" >> config
			elif [ "$Type_Li" = "WAN listerning" ]; then 	echo "Working_mode=2" >> config
			else	echo "Working_mode=1" >> config 
			fi
			./zirikatu.sh; clear; Banner; order; break;;
13)	###################### CHAOS ###########################
			cd $dir_malware_tools/CHAOS/
			go run CHAOS.go; clear; Banner; order; break;;
14)	###################### NXcrypt ###########################
			cd $dir_malware_tools/NXcrypt/
			python NXcrypt.py; clear; Banner; order; break;;	
15)	###################### Reverse0x1 ###########################
			cd $dir_malware_tools/Reverse0x1/
			python reverse.py; clear; Banner; order; break;;
17)	###################### Trolo ###########################
cd $dir_malware_tools/trolo/
			rm config > /dev/null 2>&1
			touch config
			echo "#########################################" > config
			if [ "$Type_Li" = "WAN listerning using NGROK" ]; then	echo "Working_mode=3" >> config
			elif [ "$Type_Li" = "WAN listerning" ]; then 	echo "Working_mode=2" >> config
			else	echo "Working_mode=1" >> config 
			fi
			./trolo.sh; clear; Banner; order; break;;
18)	###################### Metasploitavevasion ###########################
			cd $Work_dir/Modules/Metasploit/
			config_mode
			cd ../../$dir_malware_tools/metasploitavevasion/
			./avoid.sh; clear;cd $Work_dir; Banner; order; break;;
19)	###################### Terminator ###########################
			cd $dir_malware_tools/Terminator/
			python terminator.py; clear; Banner; order; break;;
20)	###################### HackTheWorld ###########################
			cd $dir_malware_tools/HackTheWorld/
			python HackTheWorld.py; clear; Banner; order; break;;
21)	###################### Avet ###########################
			cd $dir_malware_tools/Reverse0x1/
			python reverse.py; clear; Banner; order; break;;
22)	###################### ZeroDoor ###########################
			cd $dir_malware_tools/Zerodoor/
			python zerodoor.py; clear; Banner; order; break;;
23)	###################### Andspoilt ###########################
			cd $dir_malware_tools/Andspoilt/
			python andspoilt.py; clear; Banner; order; break;;
24)	###################### Koadic ###########################
			cd $dir_malware_tools/koadic/
			./koadic; clear; Banner; order; break;;
25)	###################### Mkvenom ###########################
			cd $dir_malware_tools/mkvenom/
			./mkvenom.sh; clear; Banner; order; break;;
99)	###################### back ###########################
	clear; Banner; order; break;;
* ) echo -e "$error1";
		echo  -ne "$input_choose";;
		esac
	done
}
function maware_tools {
	resize -s 31 104 > /dev/null 2>&1
	gen_malware_table
	echo -ne "$Choose_Tools "
	while true; do
		read choose
		case $choose in
1)	###################### BeeLogger ###########################
			cd $dir_malware_tools/BeeLogger/
			python bee.py; clear; Banner; order; break;;			
2)	###################### TheFatRat ######################
			cd $dir_malware_tools/sAINT/
			java -jar sAINT.jar; clear; Banner; order; break;;
99)	order; break;;
* ) echo -e "$error1";
		echo  -ne "$input_choose";;
		esac
	done
}
function WiFiAttacks {
		resize -s 31 104 > /dev/null
		tools_ATWifi_table
		echo  -ne "$input_choose"
		while true; do 
		read parameter
		case $parameter in 
				4 ) 	cd $Work_dir/Tools/Wireless-Attacks/wifiphisher/;
						clear; Banner; order; break;;
				5 ) 	cd $Work_dir/Tools/Wireless-Attacks/airgeddon/
					./airgeddon.sh; clear; Banner; order; break;;
				6 ) 	cd $Work_dir/Tools/Wireless-Attacks/fluxion/
					./fluxion.sh; clear; Banner; order; break;;
				99 ) clear; Banner; order; break;;
				* ) echo -e "$error1";
				echo  -ne "$input_choose";;
		esac
		done
}
check_privilegies
check_folder
language
order
