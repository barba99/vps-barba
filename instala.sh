#!/bin/bash
clear
IP=$(wget -o /dev/null -O- http://glemyson.hol.es)
mkdir /etc/CONFVPS
mkdir /etc/CONFVPS/usuarios
read -p "DIGITE SU IP: " -e -i $IP IP
read -p "DIGITE SU NOMBRR: " nome
echo "$IP" >/etc/IP
echo "$IP" >/etc/IPMENU
echo "$nome" >/etc/dono
clear
echo -e "\033[0m                \033[47;30mACTUALIZANDO CONFVPS 3.0... \033[0m" 
if yum -y update 1>/dev/null 2>/dev/null
then
yum -y update 1>/dev/null 2>/dev/null
yum -y install git 1>/dev/null 2>/dev/null
git clone https://github.com/GlEmYsSoN-LiNuX/CONFVPS.git 1>/dev/null 2>/dev/null
cd CONFVPS
rm -rf README.md
rm -rf install
rm -rf remove.sh
for arqs in `ls`
do
rm /bin/$arqs 2>/dev/null
mv $arqs /bin
chmod +x /bin/$arqs
done
echo -e "\033[0;32mINSTALACIO CREADA CON ÉXITO"
echo -e "\033[0;32mUSE EL COMANDO:\033[1;37m CONFVPS"
echo -e "\033[0;32mPARA ENTRAR AL MENU...!"
else
clear
echo -e "\033[0m                \033[47;30mINSTALANDO CONFVPS 2.0... \033[0m" 
apt-get update 1>/dev/null 2>/dev/null
apt-get install -y git 1>/dev/null 2>/dev/null
git clone https://github.com/GlEmYsSoN-LiNuX/CONFVPS.git 1>/dev/null 2>/dev/null
cd CONFVPS
rm -rf README.md
rm -rf installer.sh
rm -rf remove.sh
for arqs in `ls`
do
rm /bin/$arqs 2>/dev/null
mv $arqs /bin
chmod +x /bin/$arqs
done
echo -e "\033[0;32mINSTALACION CREADA CON EXITO"
echo -e "\033[0;32mUSE EL COMANDO:\033[1;37m CONFVPS"
echo -e "\033[0;32mPARA ENTRAR AL MENU...!"
fi
cd
rm -rf installer.sh 2> /dev/null
rm -rf CONFVPS 2> /dev/null
