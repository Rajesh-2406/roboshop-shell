echo -e "\e[33m Install GoLang \e[0m"
yum install golang -y

echo -e "\e[33m Add Application User \e[0m"
useradd roboshop

echo -e "\e[33m Setup the App directory\e[0m"
mkdir /app

echo -e "\e[33m Download the Application Content \e[0m"
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip

echo -e "\e[33m Extract the Application Content \e[0m"
unzip /tmp/dispatch.zip

echo -e "\e[33m Download the Application Dependencies\e[0m"
cd /app
go mod init dispatch

echo -e "\e[33m Build the Software \e[0m"
go get
go build

echo -e "\e[33m Start the dispatch Service \e[0m"
systemctl daemon-reload
systemctl enable dispatch
systemctl start dispatch


