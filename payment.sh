
echo -e "\e[33m Install the python \e[0m"
yum install python36 gcc python3-devel -y &>>/tmp/roboshop.log

echo -e "\e[33m Add Application User \e[0m"
useradd roboshop &>>/tmp/roboshop.log

echo -e "\e[33m Create the Application Diretectory \e[0m"
rm -f /app &>>/tmp/roboshop.log
mkdir /app

echo -e "\e[33m Download Application Content \e[0m"
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip &>>/tmp/roboshop.log
cd /app

echo -e "\e[33m Extract the Application Content\e[0m"
unzip /tmp/payment.zip &>>/tmp/roboshop.log

echo -e "\e[33m Install the Application Dependencies\e[0m"
cd /app
pip3.6 install -r requirements.txt &>>/tmp/roboshop.log

echo -e "\e[33m Setup the SystenD File \e[0m"
cp /home/centos/roboshop-shell/payment.service /etc/systed/system/payment.mysql &>>/tmp/roboshop.log


echo -e "\e[33m Start Payment Service \e[0m"
systemctl daemon-reload &>>/tmp/roboshop.log
systemctl enable payment &>>/tmp/roboshop.log
systemctl start payment &>>/tmp/roboshop.log
