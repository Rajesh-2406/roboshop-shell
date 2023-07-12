source common.sh
echo -e "${color} Install GoLang ${nocolor}"
yum install golang -y  &>>log_file

echo -e "${color} Add Application User ${nocolor}"
useradd roboshop  &>>log_file

echo -e "${color} Setup the App directory ${nocolor}"
mkdir /app  &>>log_file

echo -e "${color} Download the Application Content ${nocolor}"
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip  &>>log_file

echo -e "${color} Extract the Application Content ${nocolor}"
unzip /tmp/dispatch.zip  &>>log_file

echo -e "${color} Download the Application Dependencies ${nocolor}"
cd /app
go mod init dispatch

echo -e "${color} Build the Software ${nocolor}"
go get
go build

echo -e "${color} Start the dispatch Service ${nocolor}"
systemctl daemon-reload  &>>log_file
systemctl enable dispatch  &>>log_file
systemctl start dispatch  &>>log_file


