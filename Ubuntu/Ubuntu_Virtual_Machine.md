# Ubuntu Virtual Machine

Alright boyos, we're using the ***wonderful*** VM VirtualBox by the *wonderful* company that is oracle. (Oracle, you should totally sponsor us).



## Setup Process
We're interested in doing this as fast as possible, here's a quick rundown on the order this should be done in:
1. Download the [VM VirtualBox binaries][] for your OS and [set it up](#virtualbox-installation)

2. Download the [Ubuntu Desktop][] to a convenient location

3. After the virtual machine hard disk is set up and Ubuntu has finished installing, [set up the environemnt](#virtualbox-environment-setup)

   ​
## Program Installation Help



### VirtualBox Installation
The program is fairly straightforward to install, simply run the .exe and follow the default settings set by the install wizard.

Once you have VirtualBox Installed, it's time to set up the virtual machine you will use, which is fairly simple.
1. Click on "*New*" in the top left corner of the program

  ![ShitsFucked](https://i.imgur.com/nfhQJHH.png)
  
2. Type what you want as the name of the virtual machine, set the type to Linux, and version to Ubunutu (64-bit). Click next.
  ![OhWell](https://i.imgur.com/dZKlg2m.png)
  
3. Set the amount of RAM you want allocated to the virtual machine. Ubuntu needs at least 2GB to run but Windows 10 requires 2GB aswell. A good starting point for this setting is 4GB. If you have more RAM to spare, about 45% of the total should be much more than enough. Once again, click next.

  ![WereGoing](https://i.imgur.com/iSXFMhN.png)

[//]: # "Formatting issue, table should be on right side of picture"

| GB   |      |   MB |
| ---- | :--: | ---: |
| 2GB  |  =   | 2048 |
| 4GB  |  =   | 4096 |
| 8GB  |  =   | 8192 |

4. Now we need to create space for the virtual machine's memory. Essentially, this is the equivalent of setting up a hard drive for it, but ***virtual***. First, select "Create a virtual hard disk now" and click create. We want a VDI (VirtualBox Disk Image), so select that option and click next. For purposes of optimisation, we want to select "Dynamically allocated" then click next. I would recommend leaving the name of the file as the name of the virtual machine, but it is up to you. Ubuntu requires at least 25GB of memory; for our purposes this is enough but if you want to have external programs (or large code bases) saved, I would recommend setting the memory to 100GB, click create.

  ![IReally](https://i.imgur.com/eFPLKOT.png) ![NeedTo](https://i.imgur.com/GC4gyYP.png) 
  ![FigureOut](https://i.imgur.com/KSNYygs.png) ![Compression](https://i.imgur.com/USLk8sr.png)

5. Once the set up process finishes, your virtual machine will have been created. While we wait, [go back up](#setup-process) and download Ubuntu Desktop.

   ​

# VirtualBox Environment Setup

Switching over to the virtual box window, select the created virtual machine and click start. This will bring up a prompt window asking for the appropriate IO image. Ubuntu should be the only option that pops up after clicking on the option, select it and click next. This will set up the environment and open a window which is running Ubuntu.

![](https://i.imgur.com/5iPqFsn.png) ![](https://i.imgur.com/M5Zbf8A.png)

For help setting up Ubuntu, [go to the next tutorial!][]

### Oi mate, update me please. DON'T LET THIS SHIP

[//]: # "Links to all the viruses used for the guide SHIT IS BAD, DON'T SHIP"
[VM VirtualBox binaries]: <https://www.virtualbox.org/wiki/Downloads>
[Ubuntu Desktop]: <https://www.ubuntu.com/download/desktop>
[go to the next tutorial!]: <www.google.com>
