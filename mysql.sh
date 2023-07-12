 source coomon.sh


echo -e "${color}Disable Mysql Default Version ${nocolor}"
yum module disable mysql -y &>>log_file
stat_check $?

echo -e "${color} Copy Mysql repo file ${nocolor}"
cp /home/centos/roboshop-shell/mysql.repo /etc/yum.repo.d/mysql.repo &>>log_file
stat_check $?

echo -e "${color} Install Mysql Community Server ${nocolor}"
yum install mysql-community-server -y &>>log_file
stat_check $?

echo -e "${color} Start Mysql Service ${nocolor}"
systemctl enable mysqld &>>log_file
systemctl start mysqld &>>log_file
 stat_check $?

echo -e "${color} Setup Mysql Password ${nocolor}"
mysql_secure_installation --set-root-pass RoboShop@1 &>>log_file
stat_check $?
