#packages:
# libkakasi2-dev
# kakasi-dic
#end:
echo "#############################################################"
echo "#"
echo "#  Gauche-text-kakasi"
echo "#"
echo "#"
cd /home/gauche
git clone --depth 1 https://github.com/shirok/Gauche-text-kakasi.git
cd Gauche-text-kakasi
./configure
make -j
make -s check
