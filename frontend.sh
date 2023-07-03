echo -e "\e[33minstalling nginx server\e[om"
yum install nginx -y &>>/tmp/roboshop.log
echo -e "\e[33REmovving old app content\e[om"

rm -rf /usr/share/nginx/html/* &>>/tmp/roboshop.log

echo -e "\e[33Downloding frontend content\e[om"

curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>/tmp/roboshop.log
echo -e "\e[33mExtract frontend content\e[om"


cd /usr/share/nginx/html
unzip /tmp/frontend.zip &>>/tmp/roboshop.log


echo -e "\e[33mstarting nginx server\e[om"
systemctl enable nginx &>>/tmp/roboshop.log
systemctl restart nginx &>>/tmp/roboshop.log