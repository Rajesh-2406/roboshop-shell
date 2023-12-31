source common.sh

echo -e "${color} Configure Erlang repos ${nocolor}"
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash &>>/tmp/roboshop.log
stat_check $?

echo -e "${color} Configure Rabbitmq Repos ${nocolor}"
bbitmcurl -s https://packagecloud.io/install/repositories/rabbitmq/raq-server/script.rpm.sh | bash &>>/tmp/roboshop.log
stat_check $?

echo -e "${color} Install Rabbitmq Server${nocolor}"
yum install rabbitmq-server -y &>>/tmp/roboshop.log
stat_check $?

echo -e "${color} Start Rabbitmq Service ${nocolor}"
systemctl enable rabbitmq-server &>>/tmp/roboshop.log
systemctl start rabbitmq-server &>>/tmp/roboshop.log
stat_check $?

echo -e "${color} Add Rabbitmq Application user ${nocolor}"
rabbitmqctl add_user roboshop roboshop123 &>>/tmp/roboshop.log
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*" &>>/tmp/roboshop.log
stat_check $?