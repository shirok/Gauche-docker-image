#packages:
# gettext
#end:
echo "#############################################################"
echo "#"
echo "#  WiLiKi"
echo "#"
echo "#"
cd /home/gauche
rm -rf WiLiKi
git clone --depth 1 https://github.com/shirok/WiLiKi.git
cd WiLiKi
./configure
make -j
make -s check
