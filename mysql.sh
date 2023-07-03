
echo -e "\[33m Disable Mysql Default Version \e[0m"
yum module disable mysql -y &>>/tmp/roboshop.log

echo -e "\[33m Copy Mysql repo file \e[0m"
cp /home/centos/roboshop-shell/mysql.repo /etc/yum.repo.d/mysql.repo &>>/tmp/roboshop.log

echo -e "\[33m Install Mysql Community Server \e[0m"
yum install mysql-community-server -y &>>/tmp/roboshop.log

echo -e "\[33m Start Mysql Service \e[0m"
systemctl enable mysqld &>>/tmp/roboshop.log
systemctl start mysqld &>>/tmp/roboshop.log

echo -e "\[33m Setup Mysql Password\e[0m"
mysql_secure_installation --set-root-pass RoboShop@1 &>>/tmp/roboshop.log

