#/bin/bash

echo -e "\033[1;33m- - - - -> \033[01;34mScript para  Configurar usar SSL/TLS Stunnel4"
echo -e "\033[1;33m #################"
echo -e "\033[1;33m- - - - -> \033[01;34mScript editado por @Jorge_Barba Para  SSL / TLS Stunnel4"
echo -e "\033[1;33m #################"
echo -e "\033[1;31mC A N A L  https://www.youtube.com/channel/UCXXRtv7G43pc-yTkGQwUQNQ"
sleep 2

apt-get update -y
clear
yum update -y
apt-get install openssh-server -y
clear
apt-get install curl -y
clear
yum install openssh-server -y
clear
apt-get install openssh-client -y
clear
yum install openssh-client -y
clear
apt-get install stunnel4 -y
clear
yum install stunnel4 -y
clear
apt-get install stunnel -y
clear
yum install stunnel -y
clear

echo -e "\033[1;31mCAPTURANDO IP"
ip=$(curl https://api.ipify.org/)
echo $ip
clear

echo -e "\033[1;33m ######################################"
echo -e "\033[1;31mDIGITE ENTER"
echo -e "\033[1;33m #################"
echo -e "\033[1;31mSTART  ENTER"
echo -e "\033[1;33m ######################################"
sleep 1

echo -e "\033[1;33m ######################################"
echo -e "\033[1;31mCREANDO  CERTIFICADO"
echo -e "\033[1;33m #################"
echo -e "\033[1;31mGENERANDO  CERTIFICATE"
echo -e "\033[1;33m ######################################"
sleep 1
openssl genrsa 2048 > stunnel.key
openssl req -new -key stunnel.key -x509 -days 1000 -out stunnel.crt

echo -e "\033[1;33m ######################################"
echo -e "\033[1;31mCREANDO  UNA  NUEVA  CONFIGURACION"
echo -e "\033[1;33m #################"
echo -e "\033[1;31mCREANDO  UNA  NUEVA  CONFIGURACION"
echo -e "\033[1;33m ######################################"
sleep 2
rm /etc/stunnel/stunnel.conf
clear
rm /etc/default/stunnel4
clear
cat stunnel.crt stunnel.key > stunnel.pem 
mv stunnel.pem /etc/stunnel/
clear
echo -e "\033[1;31mESCRIBA PUERTO QUE DESEA"
echo -e "\033[1;31mPUERTO SSL"

read -p ": " port
clear

echo -e "\033[1;33m ######################################"
echo -e "\033[1;31mCONFIGURANDO  STUNNEL.CONF"
echo -e "\033[1;33m #################"
echo -e "\033[1;31mCONFIGURANDO EL  STUNNEL.CONF"
echo -e "\033[1;33m ######################################"
sleep 1

echo -e "\033[1;31m ###"
sleep 1
echo -e "\033[1;31m #########"
sleep 1
echo -e "\033[1;31m ################"
sleep 1
echo -e "\033[1;31m ########################"
sleep 1
echo -e "\033[1;31m ##################################"
sleep 1

echo "client = no " >> /etc/stunnel/stunnel.conf
echo "[ssh] " >> /etc/stunnel/stunnel.conf
echo "cert = /etc/stunnel/stunnel.pem " >> /etc/stunnel/stunnel.conf
echo "accept = $port " >> /etc/stunnel/stunnel.conf
echo "connect = 127.0.0.1:22" >> /etc/stunnel/stunnel.conf

echo -e "\033[1;33m ######################################"
echo -e "\033[1;31mCONFIGURANDO  STUNNEL4"
echo -e "\033[1;33m ###################"
echo -e "\033[1;31mCONFIGURING  THE STUNNEL"
echo -e "\033[1;33m ######################################"
sleep 1

echo "ENABLED=1 " >> /etc/default/stunnel4
echo "FILES="/etc/stunnel/*.conf" " >> /etc/default/stunnel4
echo "OPTIONS="" " >> /etc/default/stunnel4
echo "PPP_RESTART=0" >> /etc/default/stunnel4

echo -e "\033[1;33m ######################################"
echo -e "\033[1;31mINICICIANDO   STUNNEL4"
echo -e "\033[1;33m ###################"
echo -e "\033[1;31mS TARTING THE STUNNEL4"


sleep 1

echo -e "\033[1;33m ######################################"
echo -e "\033[1;31m ##### VAN A OCURRIR ERRORES ES   NORMAL USTED ESPERE 😉...######"
echo -e "\033[1;33m ######################################"
sleep 1
service ssh start 1>/dev/null 2 /dev/null
/etc/init.d/ssh start 1>/dev/null 2 /dev/null
service sshd start 1>/dev/null 2 /dev/null
/etc/init.d/sshd start 1>/dev/null 2 /dev/null
service sshd restart 1>/dev/null 2 /dev/null
/etc/init.d/sshd restart 1>/dev/null 2 /dev/null
service ssh restart 1>/dev/null 2 /dev/null
/etc/init.d/ssh restart 1>/dev/null 2 /dev/null
service stunnel4 start 1>/dev/null 2 /dev/null
/etc/init.d/stunnel4 start 1>/dev/null 2 /dev/null
service stunnel4 restart 1>/dev/null 2 /dev/null
/etc/init.d/stunnel4 restart 1>/dev/null 2 /dev/null
systemctl start stunnel4 1>/dev/null 2 /dev/null
systemctl restart stunnel 1>/dev/null 2 /dev/null
clear

echo -e "\033[1;33m #######OCORREU UNS ERROS NORMAIS PRONTO###############"
sleep 2
echo -e "\033[1;33m ###########REINICIADO...###########"
clear

echo -e "\033[1;33m ######################################"
echo -e "\033[1;31mCONFIGURACION TERMINADA CON EXITO GENERAR USUARIO O  TESTE"
echo -e "\033[1;33m ###################"
echo -e "\033[1;31mSUCESS TEST"
echo -e "\033[1;33m ######################################"
echo -e "\033[1;33m- - - - -> \033[01;34mSEU IP HOST:\033[0m $ip"
echo -e "\033[1;33m- - - - -> \033[01;34mPORT SSL:\033[0m $port"
sleep 1
echo -e "\033[1;31mSE NAO FUNCIONAR FAZ O COMANDO REBOOT"
sleep 2
echo -e "\033[1;33m- - ->>C A N A L \033[01;34mhttps://www.youtube.com/channel/UCXXRtv7G43pc-yTkGQwUQNQ"
echo -e "\033[1;33m- - ->>EDITADO POR \033[01;34m  @Jorge_Barba"
sleep 1
