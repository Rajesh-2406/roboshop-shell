
echo -e "\e[31mcopy mongoDB Repo file \e[om"
cp mongodb.repo /etc/yum.repos.d/mongodb.repo &>>/tmp/roboshop.log
echo -e "\e[31minstalling mongodb server \e[om"
yum install mongodb-org -y &>>/tmp/roboshop.log
# modify the config file
echo -e "\e[31mstart mongodb service \e[om"

systemctl enable mongod &>>/tmp/roboshop.log
systemctl restart mongod &>>/tmp/roboshop.log