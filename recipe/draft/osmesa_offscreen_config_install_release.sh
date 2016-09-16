cd 
tar -xzvf /home/lrahmani/packages/mesa-11.0.0-rc3.tar.gz 
cd mesa-11.0.0-rc3/
apt-get update
apt-get install build-essential
apt-get install llvm-dev

# From OSMesa official web page
#./configure --enable-osmesa --disable-driglx-direct --disable-dri --with-gallium-drivers=swrast
#./configure --enable-osmesa --disable-driglx-direct --disable-egl --disable-dri --with-gallium-drivers=swrast
#./configure --enable-osmesa --disable-driglx-direct --disable-egl --disable-dri --with-gallium-drivers=swrast   --enable-opengl --disable-gles1 --disable-gles2             --disable-va --disable-gbm --disable-xvmc --disable-vdpau   --enable-shared-glapi                                       --disable-texture-float                                     --disable-dri --with-dri-drivers=                           --enable-gallium-llvm --enable-llvm-shared-libs             --with-gallium-drivers=swrast,swr                           --disable-egl --disable-gbm --with-egl-platforms=           --enable-gallium-osmesa                                     --enable-glx                                                --prefix=/opt/
#make -j24 distclean 

apt-get install bison-dev
apt-get install bison
apt-get install flex
apt-get install python-mako-dev
apt-get install python-mako

# From ParaView's Docker recepie
#./configure   --enable-opengl --disable-gles1 --disable-gles2             --disable-va --disable-gbm --disable-xvmc --disable-vdpau   --enable-shared-glapi                                       --disable-texture-float                                     --disable-dri --with-dri-drivers=                           --enable-gallium-llvm --enable-llvm-shared-libs             --with-gallium-drivers=swrast,swr                           --disable-egl --disable-gbm --with-egl-platforms=           --enable-gallium-osmesa                                     --enable-glx                                                --prefix=/opt/
#./configure   --enable-opengl --disable-gles1 --disable-gles2             --disable-va --disable-gbm --disable-xvmc --disable-vdpau   --enable-shared-glapi                                       --disable-texture-float                                     --disable-dri --with-dri-drivers=                           --enable-gallium-llvm --enable-llvm-shared-libs             --with-gallium-drivers=swrast                           --disable-egl --disable-gbm --with-egl-platforms=           --enable-gallium-osmesa                                     --enable-glx                                                --prefix=/opt/

./configure     CXXFLAGS="-O2 -g -DDEFAULT_SOFTWARE_DEPTH_BITS=31"     CFLAGS="-O2 -g -DDEFAULT_SOFTWARE_DEPTH_BITS=31"     --disable-xvmc     --disable-glx     --disable-dri     --with-dri-drivers=""     --with-gallium-drivers="swrast"     --enable-texture-float       --disable-egl     --with-egl-platforms=""     --enable-gallium-osmesa     --enable-gallium-llvm=yes     --with-llvm-shared-libs     --prefix=/opt/   --disable-driglx-direct --disable-egl --disable-dri --with-gallium-drivers=swrast
make -j24 
make -j24 install

# Build static libs
# # Check http://www.mesa3d.org/autoconf.html
#/gmake -j24 distclean
#/g./configure     CXXFLAGS="-O2 -g -DDEFAULT_SOFTWARE_DEPTH_BITS=31"     CFLAGS="-O2 -g -DDEFAULT_SOFTWARE_DEPTH_BITS=31"  --enable-static --disable-shared    --disable-xvmc     --disable-glx     --disable-dri     --with-dri-drivers=""     --with-gallium-drivers="swrast"     --enable-texture-float       --disable-egl     --with-egl-platforms=""     --enable-gallium-osmesa     --enable-gallium-llvm=yes     --with-llvm-shared-libs     --prefix=/opt/   --disable-driglx-direct --disable-egl --disable-dri --with-gallium-drivers=swrast 
#/gmake -j24 && make -j24 install

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/lib/
export CPATH=$CPATH:/opt/include/:/opt/include/GL/
