tar -xzvf /home/lrahmani/packages/ParaView-v5.0.0-source.tar.gz 
cd ParaView-v5.0.0-source/
apt-get install libxt-dev freeglut3-dev cmake-curses-gui python-dev --assume-yes
cd ..
mkdir ParaView-v5.0.0-build/
cd ParaView-v5.0.0-build/
#apt-get update
apt-get install mpich libmpich-dev
apt-get install apt-get install zlib1g-dev libhdf5-dev hdf5-tools --assume-yes
apt-get install zlib1g-dev libhdf5-dev hdf5-tools --assume-yes
cmake ~/ParaView-v5.0.0-source/ -G "Unix Makefiles" -DPARAVIEW_BUILD_QT_GUI=OFF -DPARAVIEW_ENABLE_CATALYST=ON -DPARAVIEW_ENABLE_PYTHON=ON -DPARAVIEW_USE_MPI=ON -DCMAKE_INSTALL_PREFIX=/opt/ -DBUILD_TESTING=OFF -DPARAVIEW_INSTALL_DEVELOPMENT_FILES=ON -DVTK_USE_X=OFF -DOPENGL_INCLUDE_DIR=/opt/include/GL/ -DOPENGL_gl_LIBRARY=/opt/lib/libOSMesa.so -DOPENGL_glu_LIBRARY=/opt/lib/libGLU.so -DVTK_OPENGL_HAS_OSMESA=ON -DOSMESA_INCLUDE_DIR=/opt/include/GL/ -DOSMESA_LIBRARY=/opt/lib/libOSMesa.so
make -j24 
make -j24 install

