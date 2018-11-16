#packages:
# libgtk2.0-dev
#end:
echo "#############################################################"
echo "#"
echo "#  Gauche-gtk2"
echo "#"
echo "#"
cd /home/gauche
git clone https://github.com/shirok/Gauche-gtk2.git
cd Gauche-gtk2
./DIST gen
./configure
make stubs
make -j
