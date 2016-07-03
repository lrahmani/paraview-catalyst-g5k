# paraview-g5k
(TOFIX change the title)

Mesa3D, VTK &amp; ParaView/Catalyst Grid5000 Installation Kameleon Recipe

First of all you need to install (kameleon)[https://github.com/oar-team/kameleon] on your local machine, i.e., the machine you will use to shh to Grid'5000.
```bash
sudo apt-get install ruby-dev
sudo gem install --no-ri --no-rdoc kameleon-builder
```

Then, create a folder for all kameleon recipes. Inside of it, extract that zip or checkout the code
```bash
mkdir kameleon-lab && cd kameleon-lab
git checkout https://github.com/lrahmani/paraview-catalyst-g5k.git
# OR
unzip paraview-catalyst-g5k-master.zip
```

Finally, use kameleon's `build` command to build the recipe
```bash
kameleon build paraview-g5k.yaml
```
When building the recipe for first times:
- Use checkpoint mechanism to avoid redeploying the base image for the same reservation
- Use `--debug` option when you get inexplicable errors or when the build hangs 

To change ParaView's build configuration, `install_paraview_catalyst` step will hang
after the first build. You can then login into the `in` context and use `ccmake`:

```bash
cd ~/ParaView-v5.0.0-build && ccmake .
```
Once done, generate new Makefiles, exit ccmake, logout form `in` context and continue
the build process.
