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

```
