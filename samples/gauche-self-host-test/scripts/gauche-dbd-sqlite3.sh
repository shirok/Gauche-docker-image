#packages:
# libsqlite3-dev
#end:
echo "#############################################################"
echo "#"
echo "#  Gauche-dbd-sqlite3"
echo "#"
echo "#"
cd /home/gauche
git clone https://github.com/mhayashi1120/Gauche-dbd-sqlite3.git
cd Gauche-dbd-sqlite3
./DIST gen
./configure
make -j
make -s check
