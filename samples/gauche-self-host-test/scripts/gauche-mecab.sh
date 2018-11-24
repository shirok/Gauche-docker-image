#packages:
# libmecab-dev
# mecab-ipadic-utf8
#end:
echo "#############################################################"
echo "#"
echo "#  Gauche-mecab"
echo "#"
echo "#"
cd /home/gauche
git clone https://github.com/shirok/Gauche-mecab.git
cd Gauche-mecab
./DIST gen
./configure
make -j
make -s check
