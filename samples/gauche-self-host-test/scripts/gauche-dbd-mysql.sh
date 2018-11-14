# mysql-server default-libmysqlclient-dev
echo "#############################################################"
echo "#"
echo "#  Gauche-dbd-mysql"
echo "#"
echo "#"
service mysql start
cd /home/gauche
git clone https://github.com/kahua/Gauche-dbd-mysql.git
cd Gauche-dbd-mysql
./DIST gen
./configure
make -j
mysql < /scripts/mysql-setup.sql
make -s check
service mysql stop
