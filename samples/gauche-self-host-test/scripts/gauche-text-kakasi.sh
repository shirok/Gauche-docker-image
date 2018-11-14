# libkakasi2-dev kakasi-dic
echo "#############################################################"
echo "#"
echo "#  Gauche-text-kakasi"
echo "#"
echo "#"
cd /home/gauche
git clone https://github.com/shirok/Gauche-text-kakasi.git
cd Gauche-text-kakasi
./configure
make -j
make -s check
