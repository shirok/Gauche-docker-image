#packages:
# libglu1-mesa-dev
# freeglut3-dev
# mesa-common-dev
# libglew-dev
# libxmu-dev
# libxi-dev
# libglfw3-dev
#end:
echo "#############################################################"
echo "#"
echo "#  Gauche-gl"
echo "#"
echo "#"
cd /home/gauche
rm -rf Gauche-gl
git clone --depth 1 https://github.com/shirok/Gauche-gl.git
cd Gauche-gl
./configure && make -j && make -s check
