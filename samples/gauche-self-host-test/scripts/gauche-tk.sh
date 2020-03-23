#packages:
# tk
#end:
echo "#############################################################"
echo "#"
echo "#  Gauche-tk"
echo "#"
echo "#"
cd /home/gauche
git clone --depth 1 https://github.com/shirok/Gauche-tk.git
cd Gauche-tk
./configure
make
make -s check

