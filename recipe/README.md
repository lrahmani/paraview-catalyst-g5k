## This is a draft ... DO NOT use the code unless you know what you are doing

#### 1. Check if materiel is recongnized

```bash
root@chirloute-6:~# apt-get update
root@chirloute-6:~# apt-get install pciutils
root@chirloute-6:~# lspci | grep Tesla
04:00.0 PCI bridge: NVIDIA Corporation NF200 PCIe 2.0 switch for Quadro Plex S4 / Tesla S870 / Tesla S1070 / Tesla S2050 (rev a3)
05:00.0 PCI bridge: NVIDIA Corporation NF200 PCIe 2.0 switch for Quadro Plex S4 / Tesla S870 / Tesla S1070 / Tesla S2050 (rev a3)
05:01.0 PCI bridge: NVIDIA Corporation NF200 PCIe 2.0 switch for Quadro Plex S4 / Tesla S870 / Tesla S1070 / Tesla S2050 (rev a3)
05:02.0 PCI bridge: NVIDIA Corporation NF200 PCIe 2.0 switch for Quadro Plex S4 / Tesla S870 / Tesla S1070 / Tesla S2050 (rev a3)
05:03.0 PCI bridge: NVIDIA Corporation NF200 PCIe 2.0 switch for Quadro Plex S4 / Tesla S870 / Tesla S1070 / Tesla S2050 (rev a3)
0d:00.0 3D controller: NVIDIA Corporation GF100GL [Tesla T20 Processor] (rev a3)
0e:00.0 3D controller: NVIDIA Corporation GF100GL [Tesla T20 Processor] (rev a3)
0f:00.0 3D controller: NVIDIA Corporation GF100GL [Tesla T20 Processor] (rev a3)
10:00.0 3D controller: NVIDIA Corporation GF100GL [Tesla T20 Processor] (rev a3)
```

### 3. Get Drivers

Nvidia propose it's [own](http://www.nvidia.com/object/linux-display-amd64-310.40-driver)
installers. However, Debian, in their wiki page [DontBreakDebian](https://wiki.debian.org/DontBreakDebian), recommand to not use *manufacturer install scripts*. 
Hopefully, nvidia maintains a debian package for it's linux drivers. At the time
of writing, last [nvidia-graphics-drivers](https://packages.debian.org/source/jessie/nvidia-graphics-drivers)
stable debian package \((340.96-1\) can only installed as a source package. I 
just installed packages included in it.

```bash
root@chirloute-6:~# apt-get install linux-headers-$(uname -r|sed 's,[^-]*-[^-]*-,,')
root@chirloute-6:~# apt-get install libcuda1 libegl1-nvidia libgl1-nvidia-glx libgles1-nvidia libgles2-nvidia libnvcuvid1 libnvidia-compiler libnvidia-eglcore libnvidia-encode1 libnvidia-fbc1 libnvidia-ifr1 libnvidia-ml1 nvidia-alternative nvidia-cuda-mps nvidia-detect nvidia-driver nvidia-driver-bin nvidia-glx nvidia-kernel-dkms nvidia-kernel-source nvidia-libopencl1
 nvidia-opencl-common  nvidia-opencl-icd nvidia-smi nvidia-vdpau-driver xserver-xorg-video-nvidia
```

### 4. Install ParaView dependencies

```bash
root@chirloute-6:~# apt-get install --assume-yes libxt-dev freeglut3-dev cmake-curses-gui python-dev mpich libmpich-dev  zlib1g-dev libhdf5-dev hdf5-tools
```

### 5. Compile & install ParaView

```bash
root@chirloute-6:~/ParaView-v5.0.0-build# cmake ../ParaView-v5.0.0-source/ -G "Unix Makefiles" -DPARAVIEW_BUILD_QT_GUI=OFF -DPARAVIEW_ENABLE_CATALYST=ON -DPARAVIEW_ENABLE_PYTHON=ON -DPARAVIEW_USE_MPI=ON -DCMAKE_INSTALL_PREFIX=/opt/ -DBUILD_TESTING=OFF -DPARAVIEW_INSTALL_DEVELOPMENT_FILES=ON
root@chirloute-6:~/ParaView-v5.0.0-build# make -j8 && make -j8 install
```
