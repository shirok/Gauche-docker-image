# libglu1-mesa-dev freeglut3-dev mesa-common-dev libglew-dev \
# libxmu-dev libxi-dev
echo "#############################################################"
echo "#"
echo "#  Gauche-gl"
echo "#"
echo "#"
cd /home/gauche
rm -rf Gauche-gl
git clone https://github.com/shirok/Gauche-gl.git
cd Gauche-gl 
./DIST gen
./configure && make -j && make -s check
