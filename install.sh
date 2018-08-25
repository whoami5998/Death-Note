#!/bin/bash
Work_dir=`pwd`
Folder_Malware="Tools/Synthetic-Malware/"
Folder_WIFI="Tools/Wireless-Attacks/"
dirfile_malwarebackup="library/backup/Synthetic-Malware/"
dirfile_WIFIbackup="library/backup/Wireless-Attacks/"
dirfile_metasploitbackup="library/backup/Metasploit/"
source language/VietNamese/VN
######## Color ##############
cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[93m'
BlueF='\e[1;34m' #Biru
RESET="\033[00m" #normal
orange='\e[38;5;166m'
#############################
lnx="Linux"
lsb_release -i > distro.tmp
dist=`awk '{print $3}' distro.tmp`
dist1=`awk '{print $4}' distro.tmp`
rm -f distro.tmp >/dev/null
if [ "$dist" == "$lnx" ];
then
dist0=$dist1
else
dist0=$dist
fi
########## check file ############
function check_privilegies {
if [[ $EUID -ne 0 ]]; then
        echo -e "\e[1;31mYou don't have admin privilegies, execute the script as root.""\e[0m"""
        exit 1
fi
}
function check_folder {
check_folder_tool=`find  -name Tools -type d | grep -w "./Tools"`
if [ "$check_folder_tool" = "./Tools" ]; then
	echo ""
else
	mkdir -p $Folder_Malware
	mkdir -p $Folder_WIFI
fi
check_folder_output=`find  -name output -type d | grep -w "./output"`
if [ "$check_folder_output" = "./output" ]; then
	echo ""
else
	mkdir output
fi
check_folder_victim=`find  -name Victim -type d | grep -w "./Victim"`
if [ "$check_folder_victim" = "./Victim" ]; then
	echo ""
else
	mkdir Victim
fi
}
########## cleaning up #########
function cleanup {
echo -e "${cyan}	Clean and Update System${RESET}"
sudo apt-get install -f -y
sudo apt-get autoremove -y
sudo apt-get autoclean -y
sudo apt-get clean -y
sudo apt-get update
sudo apt-get install xterm --yes
}
function ShowAndInstall_MalwareTools {
clear
echo -e "${cyan}	Install Malware Tools${RESET}"
sleep 0.5
############# Dr0p1t-Framework ################
Drolit=`find $Folder_Malware -name Dr0p1t-Framework -type d | grep -w "Tools/Synthetic-Malware/Dr0p1t-Framework"`
	if [ "$Drolit" = "Tools/Synthetic-Malware/Dr0p1t-Framework" ]; then
		echo -e "[ ✔ ]   Dr0p1t-Framework ${white}.... ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   Dr0p1t-Framework ${white}.... ${red}$NotInstalled ${RESET}"
		cd $Folder_Malware
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download Dr0p1t-Framework <=" -e git clone https://github.com/D4Vinci/Dr0p1t-Framework.git
		cd Dr0p1t-Framework
		chmod 755 *.py | chmod 755 *.sh
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing Dr0p1t-Framework <=" -e ./install.sh
		echo -e "[ ✔ ]   Dr0p1t-Framework ${white}.... ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
############# Don't kill my cat ################	
dkmc=`find $Folder_Malware -name DKMC -type d | grep -w "Tools/Synthetic-Malware/DKMC"`
	if [ "$dkmc" = "Tools/Synthetic-Malware/DKMC" ]; then
		echo -e "[ ✔ ]   DKMC ${white}................ ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   DKMC ${white}................ ${red}$NotInstalled ${RESET}"
		cd $Folder_Malware
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download DKMC <=" -e git clone https://github.com/Mr-Un1k0d3r/DKMC.git
		cd DKMC		
		chmod 755 *.py
		echo -e "[ ✔ ]   DKMC ${white}................ ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
############# TheFatRat ################	
thefatrat=`find $Folder_Malware -name TheFatRat -type d | grep -w "Tools/Synthetic-Malware/TheFatRat"`
	if [ "$thefatrat" = "Tools/Synthetic-Malware/TheFatRat" ]; then
		echo -e "[ ✔ ]   TheFatRat ${white}........... ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   TheFatRat ${white}........... ${red}$NotInstalled ${RESET}"
	cd $Folder_Malware
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download TheFatRat <=" -e git clone https://github.com/Screetsec/TheFatRat.git
		cd TheFatRat
		chmod 755 *.sh
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing TheFatRat <=" -e ./setup.sh
		echo -e "[ ✔ ]   TheFatRat ${white}........... ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
############# msfpc ################	
msfpc=`find $Folder_Malware -name mpc -type d | grep -w "Tools/Synthetic-Malware/mpc"`
	if [ "$msfpc" = "Tools/Synthetic-Malware/mpc" ]; then
		echo -e "[ ✔ ]   Msfpc ${white}............... ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   Msfpc ${white}............... ${red}$NotInstalled ${RESET}"
cd $Folder_Malware
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download Msfpc <=" -e git clone https://github.com/g0tmi1k/mpc.git
		cd $Work_dir
		cp $dirfile_malwarebackup/mpc/msfpc.sh $Folder_Malware/mpc/
		cp $dirfile_malwarebackup/mpc/msfpc1.sh $Folder_Malware/mpc/
		cd $Folder_Malware/mpc/
		chmod 755 *.sh
		cd $Work_dir
		echo -e "[ ✔ ]   Msfpc ${white}............... ${yellow}$Installed ${RESET}"
	fi
############# winpayloads ################	
winpayloads=`find $Folder_Malware -name Winpayloads -type d | grep -w "Tools/Synthetic-Malware/Winpayloads"`
	if [ "$winpayloads" = "Tools/Synthetic-Malware/Winpayloads" ]; then
		echo -e "[ ✔ ]   Winpayloads ${white}......... ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   Winpayloads ${white}......... ${red}$NotInstalled ${RESET}"
		cd $Folder_Malware
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download Winpayloads <=" -e git clone https://github.com/nccgroup/Winpayloads.git
		cd Winpayloads
		chmod 755 *.sh
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing Winpayloads <=" -e ./setup.sh
		echo -e "[ ✔ ]   Winpayloads ${white}......... ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
############# astroid ################	
astroid=`find $Folder_Malware -name astroid -type d | grep -w "Tools/Synthetic-Malware/astroid"`
	if [ "$astroid" = "Tools/Synthetic-Malware/astroid" ]; then
		echo -e "[ ✔ ]   astroid ${white}............. ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   astroid ${white}............. ${red}$NotInstalled ${RESET}"
		cd $Folder_Malware
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download astroid <=" -e git clone https://github.com/M4sc3r4n0/astroid.git
		cd astroid
		chmod 755 *.sh
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing astroid <=" -e ./setup.sh
		echo -e "[ ✔ ]   astroid ${white}............. ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
############# Phantom-Evasio ################	
phantom=`find $Folder_Malware -name Phantom-Evasion -type d | grep -w "Tools/Synthetic-Malware/Phantom-Evasion"`
	if [ "$phantom" = "Tools/Synthetic-Malware/Phantom-Evasion" ]; then
		echo -e "[ ✔ ]   Phantom-Evasion ${white}..... ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   Phantom-Evasion ${white}..... ${red}$NotInstalled ${RESET}"
cd $Folder_Malware
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download Phantom-Evasion <=" -e git clone https://github.com/oddcod3/Phantom-Evasion.git
		cd Phantom-Evasion
		chmod 755 *.py
		echo -e "[ ✔ ]   Phantom-Evasion ${white}..... ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
############# tophat ################	
tophat=`find $Folder_Malware -name TopHat -type d | grep -w "Tools/Synthetic-Malware/TopHat"`
	if [ "$tophat" = "Tools/Synthetic-Malware/TopHat" ]; then
		echo -e "[ ✔ ]   TopHat ${white}.............. ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   TopHat ${white}.............. ${red}$NotInstalled ${RESET}"
cd $Folder_Malware
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download TopHat <=" -e git clone https://github.com/stnby/TopHat.git
		cd TopHat
		chmod 755 *.py
		echo -e "[ ✔ ]   TopHat ${white}.............. ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
############# mpm ################	
mpm=`find $Folder_Malware -name Meterpreter_Paranoid_Mode-SSL -type d | grep -w "Tools/Synthetic-Malware/Meterpreter_Paranoid_Mode-SSL"`
	if [ "$mpm" = "Tools/Synthetic-Malware/Meterpreter_Paranoid_Mode-SSL" ]; then
		echo -e "[ ✔ ]   MPM ${white}................. ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   MPM ${white}................. ${red}$NotInstalled ${RESET}"
cd $Folder_Malware
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download MPM <=" -e git clone https://github.com/r00t-3xp10it/Meterpreter_Paranoid_Mode-SSL.git
		cd $Work_dir
		cp $dirfile_malwarebackup/Meterpreter_Paranoid_Mode-SSL/Meterpreter_Paranoid_Mode.sh $Folder_Malware/Meterpreter_Paranoid_Mode-SSL/
		cd $Folder_Malware/Meterpreter_Paranoid_Mode-SSL/
		chmod 755 *.sh
		cd $Work_dir
		echo -e "[ ✔ ]   MPM ${white}................. ${yellow}$Installed ${RESET}"
	fi
############# venom ################	
venom=`find $Folder_Malware -name venom -type d | grep -w "Tools/Synthetic-Malware/venom"`
	if [ "$venom" = "Tools/Synthetic-Malware/venom" ]; then
		echo -e "[ ✔ ]   venom ${white}............... ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   venom ${white}............... ${red}$NotInstalled ${RESET}"
		cd $Folder_Malware
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download venom <=" -e git clone https://github.com/r00t-3xp10it/venom.git
		echo -e "[ ✔ ]   venom ${white}............... ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
############# HERCULES ################	
HERCULES=`find $Folder_Malware -name HERCULES -type d | grep -w "Tools/Synthetic-Malware/HERCULES"`
	if [ "$HERCULES" = "Tools/Synthetic-Malware/HERCULES" ]; then
		echo -e "[ ✔ ]   HERCULES ${white}............ ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   HERCULES ${white}............ ${red}$NotInstalled ${RESET}"
		cd $Folder_Malware
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download HERCULES <=" -e git clone https://github.com/EgeBalci/HERCULES.git
		cd HERCULES
		chmod 755 *.go
		chmod 755 HERCULES
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing HERCULES <=" -e go get github.com/fatih/color
xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing HERCULES <=" -e go run Setup.go
		echo -e "[ ✔ ]   HERCULES ${white}............ ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
############# zirikatu ################	
zirikatu=`find $Folder_Malware -name zirikatu -type d | grep -w "Tools/Synthetic-Malware/zirikatu"`
	if [ "$zirikatu" = "Tools/Synthetic-Malware/zirikatu" ]; then
		echo -e "[ ✔ ]   zirikatu ${white}............ ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   zirikatu ${white}............ ${red}$NotInstalled ${RESET}"
		cd $Folder_Malware
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download zirikatu <=" -e git clone https://github.com/pasahitz/zirikatu.git
		cd $Work_dir
		cp $dirfile_malwarebackup/zirikatu/zirikatu.sh $Folder_Malware/zirikatu/
		cd $Folder_Malware/zirikatu/
		chmod 755 *.sh
		echo -e "[ ✔ ]   zirikatu ${white}............ ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
############# CHAOS ################	
CHAOS=`find $Folder_Malware -name CHAOS -type d | grep -w "Tools/Synthetic-Malware/CHAOS"`
	if [ "$CHAOS" = "Tools/Synthetic-Malware/CHAOS" ]; then
		echo -e "[ ✔ ]   CHAOS ${white}............... ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   CHAOS ${white}............... ${red}$NotInstalled ${RESET}"
cd $Folder_Malware
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download CHAOS <=" -e git clone https://github.com/tiagorlampert/CHAOS.git
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing CHAOS <=" -e go get github.com/kbinani/screenshot 
xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing CHAOS <=" -e go get github.com/lxn/win
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing CHAOS <=" -e go install github.com/kbinani/screenshot 
xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing CHAOS <=" -e go install github.com/lxn/win
		cd CHAOS
		chmod 755 *.go
		echo -e "[ ✔ ]   CHAOS ${white}............... ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
############# NXcrypt ################
NXcrypt=`find $Folder_Malware -name NXcrypt -type d | grep -w "Tools/Synthetic-Malware/NXcrypt"`
	if [ "$NXcrypt" = "Tools/Synthetic-Malware/NXcrypt" ]; then
		echo -e "[ ✔ ]   NXcrypt ${white}............. ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   NXcrypt ${white}............. ${red}$NotInstalled ${RESET}"
		cd $Folder_Malware
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download NXcrypt <=" -e git clone https://github.com/Hadi999/NXcrypt.git
		cd NXcrypt		
		chmod 755 *.py
		echo -e "[ ✔ ]   NXcrypt ${white}............. ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
############# Reverse0x1 ################	
Reverse0x1=`find $Folder_Malware -name Reverse0x1 -type d | grep -w "Tools/Synthetic-Malware/Reverse0x1"`
	if [ "$Reverse0x1" = "Tools/Synthetic-Malware/Reverse0x1" ]; then
		echo -e "[ ✔ ]   Reverse0x1 ${white}.......... ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   Reverse0x1 ${white}.......... ${red}$NotInstalled ${RESET}"
		cd $Folder_Malware
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download Reverse0x1 <=" -e git clone https://github.com/LukaSikic/Reverse0x1.git
		cd Reverse0x1
		chmod 755 *.py
		echo -e "[ ✔ ]   Reverse0x1 ${white}.......... ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
############# The-backdoor-factory ################	
backdoorfactory=`find $Folder_Malware -name the-backdoor-factory -type d | grep -w "Tools/Synthetic-Malware/the-backdoor-factory"`
	if [ "$backdoorfactory" = "Tools/Synthetic-Malware/the-backdoor-factory" ]; then
		echo -e "[ ✔ ]   The-backdoor-factory ${white} ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   The-backdoor-factory ${white} ${red}$NotInstalled ${RESET}"
cd $Folder_Malware
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download The-backdoor-factory <=" -e git clone  https://github.com/secretsquirrel/the-backdoor-factory.git
		cd the-backdoor-factory
		chmod 755 *.py | chmod 755 *.sh
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing The-backdoor-factory <=" -e ./install.sh
		echo -e "[ ✔ ]   The-backdoor-factory ${white} ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
############# trolo ################	
trolo=`find $Folder_Malware -name trolo -type d | grep -w "Tools/Synthetic-Malware/trolo"`
	if [ "$trolo" = "Tools/Synthetic-Malware/trolo" ]; then
		echo -e "[ ✔ ]   Trolo ${white}............... ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   Trolo ${white}............... ${red}$NotInstalled ${RESET}"
		cd $Folder_Malware
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download Trolo <=" -e git clone https://github.com/b3rito/trolo.git
		cd $Work_dir
		cp $dirfile_malwarebackup/trolo/trolo.sh $Folder_Malware/trolo/
		cd $Folder_Malware/trolo/
		chmod 755 *.sh
		echo -e "[ ✔ ]   Trolo ${white}............... ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
############# Metasploitavevasion ################
metasploitavevasion=`find $Folder_Malware -name metasploitavevasion -type d | grep -w "Tools/Synthetic-Malware/metasploitavevasion"`
	if [ "$metasploitavevasion" = "Tools/Synthetic-Malware/metasploitavevasion" ]; then
		echo -e "[ ✔ ]   Metasploitavevasion ${white}. ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   Metasploitavevasion ${white}. ${red}$NotInstalled ${RESET}"
		cd $Folder_Malware
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download Metasploitavevasion <=" -e git clone https://github.com/nccgroup/metasploitavevasion.git
		cd $Work_dir
		#cp $dirfile_malwarebackup/metasploitavevasion/metasploitavevasion.sh $Folder_Malware/metasploitavevasion/
		cd $Folder_Malware/metasploitavevasion/
		chmod 755 *.sh
		echo -e "[ ✔ ]   Metasploitavevasion ${white}. ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
############# Terminator ################
Terminator=`find $Folder_Malware -name Terminator -type d | grep -w "Tools/Synthetic-Malware/Terminator"`
	if [ "$Terminator" = "Tools/Synthetic-Malware/Terminator" ]; then
		echo -e "[ ✔ ]   Terminator ${white}.......... ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   Terminator ${white}.......... ${red}$NotInstalled ${RESET}"
		cd $Folder_Malware
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download Terminator <=" -e git clone https://github.com/MohamedNourTN/Terminator.git
		cd $Work_dir
		#cp $dirfile_malwarebackup/Terminator/Terminator.sh $Folder_Malware/Terminator/
		cd $Folder_Malware/Terminator/
		chmod 755 *.py
		echo -e "[ ✔ ]   Terminator ${white}.......... ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
############# HackTheWorld ################
HackTheWorld=`find $Folder_Malware -name HackTheWorld -type d | grep -w "Tools/Synthetic-Malware/HackTheWorld"`
	if [ "$HackTheWorld" = "Tools/Synthetic-Malware/HackTheWorld" ]; then
		echo -e "[ ✔ ]   HackTheWorld ${white}........ ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   HackTheWorld ${white}........ ${red}$NotInstalled ${RESET}"
		cd $Folder_Malware
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download HackTheWorld <=" -e git clone https://github.com/stormshadow07/HackTheWorld.git
		cd $Work_dir
		#cp $dirfile_malwarebackup/HackTheWorld/HackTheWorld.py $Folder_Malware/Terminator/
		cd $Folder_Malware/HackTheWorld/
		chmod 755 *.py
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing HackTheWorld <=" -e ./install.sh
		echo -e "[ ✔ ]   HackTheWorld ${white}........ ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
############# Avet ################
avet=`find $Folder_Malware -name avet -type d | grep -w "Tools/Synthetic-Malware/avet"`
	if [ "$avet" = "Tools/Synthetic-Malware/avet" ]; then
		echo -e "[ ✔ ]   Avet ${white}................ ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   Avet ${white}................ ${red}$NotInstalled ${RESET}"
		cd $Folder_Malware
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download Avet <=" -e git clone https://github.com/govolution/avet.git
		cd $Work_dir
		#cp $dirfile_malwarebackup/Terminator/Terminator.sh $Folder_Malware/Terminator/
		echo -e "[ ✔ ]   Avet ${white}................ ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
############# ZeroDoor ################
Zerodoor=`find $Folder_Malware -name Zerodoor -type d | grep -w "Tools/Synthetic-Malware/Zerodoor"`
	if [ "$Zerodoor" = "Tools/Synthetic-Malware/Zerodoor" ]; then
		echo -e "[ ✔ ]   ZeroDoor ${white}............ ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   ZeroDoor ${white}............ ${red}$NotInstalled ${RESET}"
		cd $Folder_Malware
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download ZeroDoor <=" -e git clone https://github.com/Souhardya/Zerodoor.git
		cd $Work_dir
		#cp $dirfile_malwarebackup/Terminator/Terminator.sh $Folder_Malware/Terminator/
		cd $Folder_Malware/Zerodoor/
		chmod 755 *.py
		echo -e "[ ✔ ]   ZeroDoor ${white}............ ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
############# Andspoilt ################
Andspoilt=`find $Folder_Malware -name Andspoilt -type d | grep -w "Tools/Synthetic-Malware/Andspoilt"`
	if [ "$Andspoilt" = "Tools/Synthetic-Malware/Andspoilt" ]; then
		echo -e "[ ✔ ]   Andspoilt ${white}........... ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   Andspoilt ${white}........... ${red}$NotInstalled ${RESET}"
		cd $Folder_Malware
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download Andspoilt <=" -e git clone https://github.com/sundaysec/Andspoilt.git
		cd $Work_dir
		#cp $dirfile_malwarebackup/Terminator/Terminator.sh $Folder_Malware/Terminator/
		cd $Folder_Malware/Andspoilt/
		chmod 755 *.py
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing Andspoilt <=" -e python setup.py install
		echo -e "[ ✔ ]   Andspoilt ${white}........... ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
############# Koadic ################
koadic=`find $Folder_Malware -name koadic -type d | grep -w "Tools/Synthetic-Malware/koadic"`
	if [ "$koadic" = "Tools/Synthetic-Malware/koadic" ]; then
		echo -e "[ ✔ ]   Koadic ${white}.............. ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   Koadic ${white}.............. ${red}$NotInstalled ${RESET}"
		cd $Folder_Malware
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download Koadic <=" -e git clone https://github.com/zerosum0x0/koadic.git
		cd $Work_dir
		#cp $dirfile_malwarebackup/Terminator/Terminator.sh $Folder_Malware/Terminator/
		cd $Folder_Malware/koadic/
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing Koadic <=" -e pip install -r requirements.txt
		echo -e "[ ✔ ]   Koadic ${white}.............. ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
############# Mkvenom ################
mkvenom=`find $Folder_Malware -name mkvenom -type d | grep -w "Tools/Synthetic-Malware/mkvenom"`
	if [ "$mkvenom" = "Tools/Synthetic-Malware/mkvenom" ]; then
		echo -e "[ ✔ ]   Mkvenom ${white}............. ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   Mkvenom ${white}............. ${red}$NotInstalled ${RESET}"
		cd $Folder_Malware
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download Mkvenom <=" -e git clone https://github.com/phraxoid/mkvenom.git
		cd $Work_dir
		#cp $dirfile_malwarebackup/Terminator/Terminator.sh $Folder_Malware/Terminator/
		cd $Folder_Malware/mkvenom/
		chmod 755 *.sh
		echo -e "[ ✔ ]   Mkvenom ${white}............. ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
############# BeeLogger ################	
BeeLogger=`find $Folder_Malware -name BeeLogger -type d | grep -w "Tools/Synthetic-Malware/BeeLogger"`
	if [ "$BeeLogger" = "Tools/Synthetic-Malware/BeeLogger" ]; then
		echo -e "[ ✔ ]   BeeLogger ${white}........... ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   BeeLogger ${white}........... ${red}$NotInstalled ${RESET}"
	cd $Folder_Malware
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download BeeLogger <=" -e git clone https://github.com/4w4k3/BeeLogger.git
		cd BeeLogger
		chmod 755 *.sh | chmod 755 *.py
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing BeeLogger <=" -e ./install.sh
		echo -e "[ ✔ ]   BeeLogger ${white}........... ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
############# sAINT ################
	sAINT=`find $Folder_Malware -name sAINT -type d | grep -w "Tools/Synthetic-Malware/sAINT"`
	if [ "$sAINT" = "Tools/Synthetic-Malware/sAINT" ]; then
		echo -e "[ ✔ ]   sAINT ${white}............... ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   sAINT ${white}............... ${red}$NotInstalled ${RESET}"
	cd $Folder_Malware
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download sAINT <=" -e git clone https://github.com/tiagorlampert/sAINT.git
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing sAINT <=" -e apt install maven default-jdk default-jre openjdk-8-jdk openjdk-8-jre -y
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing sAINT <=" -e apt install zlib1g-dev libncurses5-dev lib32z1 lib32ncurses6 -y
		cd sAINT
		chmod +x configure.sh
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing sAINT <=" -e ./configure.sh
		echo -e "[ ✔ ]   sAINT ${white}............... ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
##################################
sleep 1
}

function ShowAndInstall_WiFiTools {
clear
echo -e "${cyan}	Install WIFI Tools${RESET}"
sleep 0.5
############# Fluxion ################
fluxion=`find $Folder_WIFI -name fluxion -type d | grep -w "Tools/Wireless-Attacks/fluxion"`
	if [ "$fluxion" = "Tools/Wireless-Attacks/fluxion" ]; then
		echo -e "[ ✔ ]   Fluxion ${white}............. ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   Fluxion ${white}............. ${red}$NotInstalled ${RESET}"
		cd $Folder_WIFI
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download Fluxion <=" -e git clone https://github.com/wi-fi-analyzer/fluxion.git
		cd fluxion
		chmod 755 *.sh
		cd install
		chmod 755 *.sh		
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing Fluxion <=" -e ./install.sh
		cd $Work_dir
		cp $dirfile_WIFIbackup/fluxion/fluxion.sh $Folder_WIFI/fluxion/
		cp -r $dirfile_WIFIbackup/fluxion/sites/* $Folder_WIFI/fluxion/sites/
		cd $Folder_WIFI/fluxion/
		chmod 755 *.sh
		cd $Work_dir
		echo -e "[ ✔ ]   Fluxion ${white}............. ${yellow}$Installed ${RESET}"
	fi
############# Wifiphisher ################
wifiphisher=`find $Folder_WIFI -name wifiphisher -type d | grep -w "Tools/Wireless-Attacks/wifiphisher/wifiphisher"`
	if [ "$wifiphisher" = "Tools/Wireless-Attacks/wifiphisher/wifiphisher" ]; then
		echo -e "[ ✔ ]   Wifiphisher ${white}......... ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   Wifiphisher ${white}......... ${red}$NotInstalled ${RESET}"
	cd $Folder_WIFI
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download Wifiphisher <=" -e git clone https://github.com/wifiphisher/wifiphisher.git
		cd wifiphisher
		chmod 755 *.py
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing Wifiphisher <=" -e sudo python setup.py install
		echo -e "[ ✔ ]   Wifiphisher ${white}......... ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
############# Airgeddon ################
airgeddon=`find $Folder_WIFI -name airgeddon -type d | grep -w "Tools/Wireless-Attacks/airgeddon"`
	if [ "$airgeddon" = "Tools/Wireless-Attacks/airgeddon" ]; then
		echo -e "[ ✔ ]   Airgeddon ${white}........... ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   Airgeddon ${white}........... ${red}$NotInstalled ${RESET}"
	cd $Folder_WIFI
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download Airgeddon <=" -e git clone https://github.com/v1s1t0r1sh3r3/airgeddon.git
		cd airgeddon
		chmod 755 *.sh
		echo -e "[ ✔ ]   Airgeddon ${white}........... ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
############# hashcat ################
 	if ! [ -f /usr/bin/hashcat ]; then
                echo -e "[ ! ]   hashcat ${white}............. ${red}$NotInstalled ${RESET}"
		cd $Folder_WIFI
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download hashcat <=" -e git clone https://github.com/hashcat/hashcat.git
		cd hashcat
		make
		echo -e "[ ✔ ]   hashcat ${white}............. ${yellow}$Installed ${RESET}"
		cd $Work_dir
        else
		echo -e "[ ✔ ]   hashcat ${white}............. ${yellow}$Installed ${RESET}"
        fi
############# hcxtools and hcxdumptools ################
hcxtools=`find $Folder_WIFI -name hcxtools -type d | grep -w "Tools/Wireless-Attacks/hcxtools"`
	if [ "$hcxtools" = "Tools/Wireless-Attacks/hcxtools" ]; then
		echo -e "[ ✔ ]   hcxtools ${white}............ ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   hcxtools ${white}............ ${red}$NotInstalled ${RESET}"
	cd $Folder_WIFI
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download hcxtools <=" -e git clone https://github.com/ZerBea/hcxtools.git
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing hcxtools library <=" -e apt-get install libssl-dev libz-dev libpcap-dev libcurl4-openssl-dev -y
		cd hcxtools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing hcxtools <=" -e  make
				xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing hcxtools <=" -e sudo make install
		echo -e "[ ✔ ]   hcxtools ${white}............ ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi

hcxdumptool=`find $Folder_WIFI -name hcxdumptool -type d | grep -w "Tools/Wireless-Attacks/hcxdumptool"`
	if [ "$hcxdumptool" = "Tools/Wireless-Attacks/hcxdumptool" ]; then
		echo -e "[ ✔ ]   hcxdumptool ${white}......... ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   hcxdumptool ${white}......... ${red}$NotInstalled ${RESET}"
	cd $Folder_WIFI
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download hcxdumptool <=" -e git clone https://github.com/ZerBea/hcxdumptool.git
		cd hcxdumptool
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing hcxdumptool <=" -e  make
				xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing hcxdumptool <=" -e sudo make install
		echo -e "[ ✔ ]   hcxdumptool ${white}......... ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
############# MDK4 ################
mdk4=`find $Folder_WIFI -name mdk4 -type d | grep -w "Tools/Wireless-Attacks/mdk4"`
	if [ "$mdk4" = "Tools/Wireless-Attacks/mdk4" ]; then
		echo -e "[ ✔ ]   MDK4 ${white}................ ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   MDK4 ${white}................ ${red}$NotInstalled ${RESET}"
	cd $Folder_WIFI
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download MDK4 <=" -e git clone https://github.com/aircrack-ng/mdk4.git
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing MDK4 <=" -e apt-get install pkg-config libnl-3-dev libnl-genl-3-dev -y
		cd mdk4
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing MDK4 <=" -e  make
				xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing MDK4 <=" -e sudo make install
		echo -e "[ ✔ ]   MDK4 ${white}................ ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
##################################
sleep 1
}
function add_module_metasploits {
############# Post Metasploit  ################
if [ "$dist0" = "Kali" ]; then
	Folder_Module_Metasploit="/usr/share/metasploit-framework/modules"
else [ "$dist0" = "Ubuntu" ]
	Folder_Module_Metasploit="/opt/metasploit-framework/embedded/framework/modules"
fi
cd $dirfile_metasploitbackup
	cp upload_injectCA.rb $Folder_Module_Metasploit/post/multi/manage/upload_injectCA.rb
cd $Work_dir
sleep 1
}
function ShowAndInstall_ALLTools {
	ShowAndInstall_MalwareTools
	ShowAndInstall_WiFiTools
	add_module_metasploits
}
