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
curl -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip &>>/tmp/roboshop.log
cd /app

echo -e "\e[33m Extract Application Content\e[0m"
unzip /tmp/cart.zip
cd /app

echo -e "\e[33m Install NodeJS Dependencies\e[0m"
npm install


echo -e "\e[33m Setup SystemD Service \e[0m"
cp cart.service /etc/systemd/system/user.service

echo -e "\e[33m Start Cart Service\e[0m"
systemctl daemon-reload
systemctl enable cart
systemctl restart cart

