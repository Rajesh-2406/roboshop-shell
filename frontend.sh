source common.sh

echo -e "${color}installing nginx server ${nocolor}"
yum install nginx -y &>>/tmp/roboshop.log
stat_check $?

echo -e "${color}Removing old app content ${nocolor}"
rm -rf /usr/share/nginx/html/* &>>/tmp/roboshop.log
stat_check $?

echo -e "${color}Downloding frontend content ${nocolor}"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>/tmp/roboshop.log
stat_check $?

echo -e "${color}Extract frontend content ${nocolor}"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip &>>/tmp/roboshop.log
stat_check $?

echo -e "${color} Update Frontend Configuration ${nocolor}"
cp /home/centos/roboshop-shell/roboshop.conf /etc/nginx/default.d/roboshop.conf &>>.tmp/roboshop.log
stat_check $?

echo -e "${color}starting nginx server ${nocolor}"
systemctl enable nginx &>>/tmp/roboshop.log
systemctl restart nginx &>>/tmp/roboshop.log
stat_check $?