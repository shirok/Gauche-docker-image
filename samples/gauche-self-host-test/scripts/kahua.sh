#packages:
#end:
echo "#############################################################"
echo "#"
echo "#  Kahua"
echo "#"
echo "#"
service mysql start
cd /home/gauche
git clone --depth 1 https://github.com/kahua/Kahua.git
cd Kahua
./DIST gen
./configure
make -j
make -s check
service mysql stop
