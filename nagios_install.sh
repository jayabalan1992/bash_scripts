#!/bin/bash
RED='\033[0;31m'
NC='\033[0m' #No color
echo -e "${RED}Welcome to the installation of Nagios!${NC}"
sleep 2
printf "\n\n"
echo "========================================================================="
echo -e "${RED}Installing apache, php, and other dependencies${NC}"
sleep 1
yum install -y httpd php gcc glibc glibc-common gd gd-devel make net-snmp

echo "========================================================================="
echo -e "${RED}Creating Nagios User and Group${NC}"
sleep 2
useradd nagios
groupadd nagcmd
usermod -G nagcmd nagios
usermod -G nagcmd apache

echo -e "${RED} DOwnloading Nagios into /root/Downloads directory${NC}"
sleep 2
wget http://prdownloads.sourceforge.net/sourceforge/nagios/nagios-4.2.0.tar.gz
wget https://www.nagios-plugins.org/download/nagios-plugins-2.1.2.tar.gz
tar -xvf nagios-4.2.0.tar.gz
tar -xvf nagios-plugins-2.1.2.tar.gz

echo "=========================================================================="
cd /root/Downloads/nagios-4.2.0
./configure --with-command-group=nagcmd
make all
make install
make install-init
make install-commandmode
make install-config
make install-webconf
echo -e "${RED}Adding nagios user and setting up password for the Nagios console${NC}"
sleep 2
htpasswd -s -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
echo -e "${RED}Enter your password${NC}"
echo "Starting httpd service"
systemctl start httpd.service
cd ../nagios-plugins-2.1.2/
./configure --with-nagios-user=nagios --with-nagios-group=nagios
make
make install
echo "==========================================================================="
echo -e "${RED}Verifying the installation${NC}"
sleep 4
/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg
systemctl enable nagios
systemctl enable httpd
echo -e "${RED}Starting the NAGIOS Service"
systemctl start nagios.service
printf "\n\n\n"
echo -e "${RED}INSTALLATION SUCCESSFUL goto \"/usr/local/nagios/etc/objects/contacts. and set your email \"${NC}"
sleep 5

