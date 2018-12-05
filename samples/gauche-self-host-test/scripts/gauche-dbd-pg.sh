#packages:
# libpq-dev
# libssl-dev
# postgresql
# postgresql-client
#end:
echo "#############################################################"
echo "#"
echo "#  Gauche-dbd-pg"
echo "#"
echo "#"
service postgresql start
cd /home/gauche
git clone --depth 1 https://github.com/kahua/Gauche-dbd-pg.git
cd Gauche-dbd-pg
./DIST gen
./configure
make -j
sudo -u postgres createuser root
sudo -u postgres createdb root
make -s check
service postgresql stop
