# Ubuntu Dual Boot

Now that you've decided to sacrifice your system to the dark gods, we can get on with downloading a second OS. Ubuntu is the equivalent of prime real estate for developers. *Almost* every tool known to civilised humans is compatible with Ubuntu, and a large portion of dev-tools are only available for Ubuntu. Get your flash drive ready and let's get going!



## Setup Process

1. Download the [Ubuntu Desktop][] to a convenient location

2. [Set up an ISO image onto your flash drive](#ubuntu-iso-image)

3. [Create hard disk](#disk-management-and-me:-a-first-love) space for Ubuntu

4. [Disable Safe Boot](#giving-the-boot-to-safe-boot)

5. [Setting up Launch](#becoming-nasa)

6. [Launching Ubuntu](#meeting-an-old-friend)

   ​

## Program Installation Help



### Ubuntu ISO Image

1. Download [Rufus][]. Scroll down to the downloads tab and select the topmost option. **MAKE SURE TO BACK UP ANY FILES ON YOUR USB THAT YOU DON'T WANT TO LOSE**

2. Run the .exe. From here,

   * Select the appropriate USB drive you want to use
   * Set **Partition scheme and target system type**
   * - For Windows 8, 8.1, or 10: GPT partition scheme for UEFI
   * - For Windows 7: MBR partition scheme for BIOS or UEFI
   * File system to either FAT32 or NTFS (I personally use FAT32)
   * Click the disk image icon  (highlighted below) and select the Ubuntu ISO you downloaded earlier

   ![USB Installer](https://i.imgur.com/MC9eLO3.png)

3. Simply hit create and the magical process begins. Since we are reformatting the flash drive, it will prompt you with warnings, simply click okay to continue. After the installer finishes, you will be presented with this window. Now let's [go back up](#setup-process).

   ![Finished Image](https://i.imgur.com/2uo5aJk.png)



### Disk Management And Me: A Love Story

As a quick aside, disk management will make your life wonderful. Never underestimate the usefulness of folders and compression when interacting with your coding environment. 

1. Now we need to go to the Windows disk management space to make a nice little home for our Ubuntu. Either search "Disk Management Tool" in the search bar and select the control panel application that pop up for hit Windows+R and open "diskmgmt.msc"

   ![Disk Management](https://i.imgur.com/KtAYhIz.png)

   This will pop up with a window showing all the hard drives in your computer along with their status.

   (Ignore the stupid amount of disk partitions I have set up)

   ​

2. Now right click on the disk you want to use and select Shrink Volume...

   ![Disk Management Shrink Volume](https://i.imgur.com/IQShaup.png?1)

3. Now set the amount of data you want partitioned to the Ubuntu OS. Ubuntu requires at least 25 GB to be a happy camper, but your mileage will vary. Set the amount you want to shrink by and click shrink.

   ![Shrink Amount](https://i.imgur.com/uIGjPzN.png)

   | GB   |      | MB     |
   | ---- | ---- | ------ |
   | 25   | =    | 25600  |
   | 50   | =    | 51200  |
   | 75   | =    | 76800  |
   | 100  | =    | 102400 |

4. Once the process is done, you'll be left will an unallocated slot of memory. This will be assigned to Ubuntu later on, for now, let's [go back up](#setup-process).

   ![Disk Management Shrunk Hard Drive](https://i.imgur.com/ylxAmos.png)



###Giving The Boot To Safe Boot

As per [Microsoft][], this step carries the following warnings:

>After disabling Secure Boot and installing other software and hardware, it may be difficult to re-activate Secure Boot without restoring your PC to the factory state.
>
>Be careful when changing BIOS settings. The BIOS menu is designed for advanced users, and it's possible to change a setting that could prevent your PC from starting correctly. Be sure to follow the manufacturer's instructions exactly.

The only difficult in undoing this is deleting Ubuntu from your system. Since it's contained in the memory partition from earlier, this is fairly simple. Additionally, Ubuntu 12.04+ has support for safe boot so we can revert this after installing. 

Thankfully, we wont have to figure out our way to the system BIOS as Windows 8 and 10 come with UEFI, which we will use in a bit. Before continuing, make sure you save and close out of any open programs in your computer as we will need to restart our system. With those disclaimers said, let's get going:

1. Hold shift while selecting clicking restart from your windows menu. This step takes your computer into a restart state so make sure to pull up this guide on your phone, memorise these steps, or write things down like a caveman.

![Restarting](https://i.imgur.com/oH8Vczl.png?1)

2. In the menus that pop up select **Troubleshoot**>**Advanced Options**>**UEFI Firmware Settings**>***Restart***

   ![Troubleshoot](https://i.imgur.com/a6yQyVD.png)

   ![Advanced Options UEFI](https://i.imgur.com/Lqvqhjz.png)

   ![UEFI Firmware Settings](https://i.imgur.com/wgHaUNv.png)

   ![Restart](https://i.imgur.com/jaE2Lb1.png?1)

3. At this point, your BIOS will pop up. You'll want to find the **Security** tab, the **Boot** tab, or the **Authentication** tab depending on what manufacturer made your computer. After selecting the appropriate tab, find **Secure Boot**, press enter on the option, arrow key to disabled, and press enter once more. After switch secure boot to disabled, save and exit from the BIOS. ***You will have to option to just exist, make sure that you save AND exit***.

   ![Secure Boot](https://i.imgur.com/Wnvn9Oi.jpg)

4. Once your computer restarts, safe boot is officially turned off. If you're using Windows 8.1, you'll have a watermark telling you this. To turn that off simply install [this update][]. Now let's [go back up](#setup-process)


### Becoming NASA

Now we need to check if your system runs off UEFI or Legacy/CRM/BIOS

1. Open your run menu by hitting Windows+R and type in msinfo32. Click OK and find the row which says BIOS Mode

   ![](https://i.imgur.com/ZVMCYme.png)

2. If your version says Legacy, CRM, or BIOS, [you're ready to launch](#meeting-an-old-friend). Else, we have to configure the appropriate launch path to Ubuntu. Start by going back to the UEFI firmware menu [as done in the previous step](#giving-the-boot-to-safe-boot). From here, go to **File Browser Add Boot Option**>**USB Drive**>**EFI**>**BOOTx64.EFI**. After this, a dialog box asking for a file name will pop up, name it whatever you want and hit enter. After, switch the new boot option you added to be **Boot Option #1**. Finally, save changes and reset.

   ![USB](https://i.imgur.com/oChcNz6.png)

   ![EFI](https://i.imgur.com/NohtpHW.jpg)

   ![BOOT EFI](https://i.imgur.com/JYZy6EQ.jpg)

   ![File Name](https://i.imgur.com/KG4UXMA.jpg)

   ![Boot Option 1](https://i.imgur.com/39po6mf.jpg)

   ![Save Changes](https://i.imgur.com/bItVmaP.jpg)

3. At this point, [go back up](#setup-process)

### Meeting An Old Friend

If you are on Legacy/CRM/BIOS, simply reboot your computer with the USB plugged in. On this screen, press **F6** and select **nomodeset**. Then select **Install Ubuntu**. Then go [here][] for help setting up Ubuntu (this explains how to change the boot order for your computer). 

![Ubuntu BIOS](https://i.stack.imgur.com/FfEwE.png)



If you're on UEMI continue with this guide:

1. For UEMI it will be slightly different to get Ubuntu running. Upon restart, your computer will load the following screen if everything was done correctly. In order to prevent graphics card incompatibilities from crashing our party boat, we'll have to change a launch setting.

   ![Launched Ubuntu](https://i.imgur.com/NtJnPKr.png)

2. From here, press **e** to edit the launch options. You will find a line which says **quiet splash –––** or some variation of this. Simply append **nomodeset** to the end of it. It should read **quiet splash ––– nomodeset**. Then press F10 to launch Ubuntu. So close, yet so far. Go [here][] for help setting up Ubuntu.



[^flashdriverequirements]: If the program is not working, it may be your flash drive formatting. It must be in either FAT or NTFS. In this case, you will want to check either the NTFS Format Drive or Fat32 Format Drive boxes. **THIS WILL ERASE ANY FILES ON THE FLASH DRIVE, MAKE SURE TO BACK EVERYTHING UP JUST IN CASE**







#OI MATE, DON'T SHIP PLEASE

[//]: # (Some viruses that are required to install Ubuntu)

[Ubuntu Desktop]: https://www.ubuntu.com/download/desktop
[Rufus]: https://rufus.akeo.ie/
[Microsoft]: https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/disabling-secure-boot
[this update]: https://support.microsoft.com/en-gb/help/2902864/update-removes-the-windows-8-1-secureboot-isn-t-configured-correctly-w	"Update rollup 2887595 for windows"
[here]: www.google.com	"This will be the next portion of the Ubuntu guide"

