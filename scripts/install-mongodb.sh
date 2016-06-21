
#!/bin/bash
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927

echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list

apt-get update

apt-get install -y mongodb-org

sed -i "s/bindIp:/#&/g" /etc/mongod.conf

service mongod start

apt-get install -y php7-mongodb

service php7-fpm restart
