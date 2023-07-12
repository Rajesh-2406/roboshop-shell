source common.sh
echo -e "${color} Configuring Nodejs Repos${nocolor}"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>log_file

echo -e "${color} Install Nodejs ${nocolor}"
yum install nodejs -y &>>log_file

echo -e " ${color}Add Application User ${nocolor}"
useradd  &>>log_file

echo -e "${color} Create Application Diretectory ${nocolor}"
rm -rf /app &>>log_file
mkdir /app

echo -e "${color} Download Application Content ${nocolor}"
curl -o //user.zip https://-artifacts.s3.amazonaws.com/user.zip &>>log_file
cd /app

echo -e "${color} Extract Application Content ${nocolor}"
unzip //user.zip &>>log_file
cd /app

echo -e "${color} Install NodeJS Dependencies ${nocolor}"
npm install &>>log_file


echo -e "${color}Setup SystemD Service ${nocolor}"
cp user.service /etc/systemd/system/user.service

echo -e "${color} Start User Service ${nocolor}"
systemctl daemon-reload
systemctl enable user
systemctl restart user

echo -e "\e[ Copy mongoDB Repo file \e[${nocolor}"
cp mongodb.repo /etc/yum.repos.d/mongodb.repo

echo -e "\e[ Install MOngoDB Client \3[${nocolor}"
yum install mongodb-org-shell -y

echo -e "\e[ Load Schema \e[${nocolor}"
mongo --host mongodb.devops2406.store </app/schema/user.js