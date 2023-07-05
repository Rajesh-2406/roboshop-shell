source common.sh

echo -e "${color}Copy mongoDB Repo file ${nocolor}"
cp mongodb.repo /etc/yum.repos.d/mongodb.repo &>>/tmp/roboshop.log
stat_check $?


echo -e "${color}installing mongodb server ${nocolor}"
yum install mongodb-org -y &>>/tmp/roboshop.log
stat_check $?

# modify the config file
echo -e "${color}Start mongodb service ${nocolor}"

systemctl enable mongod &>>/tmp/roboshop.log
systemctl restart mongod &>>/tmp/roboshop.log
stat_check $?