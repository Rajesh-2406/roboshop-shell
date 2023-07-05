 source coomon.sh


echo -e "${color}Disable Mysql Default Version ${nocolor}"
yum module disable mysql -y &>>/tmp/roboshop.log
stat_check $?

echo -e "${color} Copy Mysql repo file ${nocolor}"
cp /home/centos/roboshop-shell/mysql.repo /etc/yum.repo.d/mysql.repo &>>/tmp/roboshop.log
stat_check $?

echo -e "${color} Install Mysql Community Server ${nocolor}"
yum install mysql-community-server -y &>>/tmp/roboshop.log
stat_check $?

echo -e "${color} Start Mysql Service ${nocolor}"
systemctl enable mysqld &>>/tmp/roboshop.log
systemctl start mysqld &>>/tmp/roboshop.log
 stat_check $?

echo -e "${color} Setup Mysql Password ${nocolor}"
mysql_secure_installation --set-root-pass RoboShop@1 &>>/tmp/roboshop.log
stat_check $?
