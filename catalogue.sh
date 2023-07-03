echo -e "\e[33mConfiguring Nodejs Repos\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/roboshop.log

echo -e "\e[31m Install Nodejs\e[0m"
yum install nodejs -y &>>/tmp/roboshop.log

echo -e "\e[33mAdd Application User\e[0m"
useradd roboshop &>>/tmp/roboshop.log

echo -e "\e[33m Create Application Diretectory \e[0m"
rm -rf /app &>>/tmp/roboshop.log
mkdir /app

echo -e "\e[33mDownload Application Content\e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip &>>/tmp/roboshop.log
cd /app

echo -e "\e[33m Extract Application Content\e[0m"
unzip /tmp/catalogue.zip
cd /app

echo -e "\e[33m Install NodeJS Dependencies\e[0m"
npm install


echo -e "\e[33m Setup SystemD Service \e[0m"
cp catalogue.service /etc/systemd/system/catalogue.service

echo -e "\e[33m Start Catalogue Service\e[0m"
systemctl daemon-reload
systemctl enable catalogue
systemctl restart catalogue

echo -e "\e[33m Copy mongoDB Repo file \e[0m"
cp mongodb.repo /etc/yum.repos.d/mongodb.repo

echo -e "\e[33m Install MOngoDB Client \3[0m"
yum install mongodb-org-shell -y

echo -e "\e[33m Load Schema \e[0m"
mongo --host mongodb-dev.devopsd73.store </app/schema/catalogue.js