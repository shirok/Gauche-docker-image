#packages:
# libgdbm-dev
# zlib1g-dev
# libmbedtls-dev
#end:
set -e

echo "#############################################################"
echo "#"
echo "#  Core Build with released Gauche"
echo "#"
echo "#"
cd /home/gauche
rm -rf Gauche && git clone --depth 1 https://github.com/shirok/Gauche.git
(cd Gauche && ./DIST gen)
cd /home/gauche
rm -rf Gauche-build
mkdir Gauche-build
cd Gauche-build
../Gauche/configure --prefix=/usr
make -j
make -s check
make install
make -s install-check

echo "#############################################################"
echo "#"
echo "#  Core Build with self"
echo "#"
echo "#"
cd /home/gauche
rm -rf Gauche-build
mkdir -p Gauche-build/build
cd Gauche-build/build
../../Gauche/configure --prefix=/usr
make -j
make -s check
make install
make -s install-check
