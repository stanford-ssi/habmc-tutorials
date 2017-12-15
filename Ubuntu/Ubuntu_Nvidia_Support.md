# Ubuntu Hates Discrete Graphics Cards

This guide is made for Nvidia graphics cards, unfortunately I don’t have a computer with any other brand so I am unable to write up a guide for that.

So a few things are wonky with installing Ubuntu with discrete graphics cards, because Ubuntu ¯\_(ツ)_/¯. Anyway, we’ll have to install a couple things and change some settings in order to get Nvidia graphics drivers working. This will give you support for heftier programs that require the discrete card and also enables you to use a second or third monitor.

1. Upon logging in, hit **Ctrl+Alt+t**. This brings up the Ubuntu terminal, from here type

```gedit /etc/default/grub```

This opens the location /etc/default/grub (where grub is located on install) with a text editor called gedit that comes with Ubuntu. The following screen should pop up, just find the line which says **GRUB_CMDLINE_LINUX="nomodeset”** simply delete **nomodeset** leaving **“”** in its place. Click save in the top right and close out of the window.

***Optional Information*** Leaving it in **nomodeset** would boot using integrated graphics, which causes an infinite boot loop as the drivers for those graphics are hibernating in some dark, mysterious forest. This makes your computer grumpy because it just wants to get home after a long day of storing electrons, or something, and makes it throw a fit. Which in turn makes you angry because it keeps asking for you to log in, but you just tried logging in. Then you end up getting a divorce, and you lose everything you own.

**TL;DR** It's a bad time

![grub menu](https://i.imgur.com/0O4MHrl.png)

Now, in the terminal type:
```sudo update-grub```

For future reference, if this were the only thing we were going to do, we would want to run ```reboot``` to refresh our changes but we still need to install some Intel and Nvidia drivers before restarting our system.

2. Now we need to install some drivers for our Intel processor. Type

```sudo apt-get purge nvdidia-*```

```sudo apt-get install intel-microcode```

```sudo apt-get install intel-gpu-tools```

```reboot```

At this point, your computer will restart with the proper Intel drivers running. Log back into Ubuntu and open up another terminal.

3. Now for the Nvidia drivers. First, we need to connect to a repository which is populated by the most recent Nvidia driver releases. Once we have that, we need to update our code sources, check that Ubuntu knows which drivers to download, and then finally download the drivers.

```sudo add-apt-repository ppa:graphics-drivers/ppa```

```sudo apt-get update```

```sudo ubuntu-drivers list```

```sudo ubuntu-drivers autoinstall```

This will automagically install all the programs required to run your GPU.
Once this is done running, simply type ```reboot``` and launch Ubuntu. Your GPU should be functioning once you log in.

Now [let's go on to installing the tools we need][]



[//]: # (A very lonely link)

[let's go on to installing the tools we need]: https://github.com/stanford-ssi/habmc-tutorials/blob/master/Ubuntu/Ubuntu_Required_Programs.md "Next tool installation tutorial"
