# Saying Hi to Ubuntu

Now that we have Ubuntu ready to install, it's time to go through the process of actually installing it. For quick hints about the terminal [let's go down](#a-terminal-overview).

1. First, we need to actually select **Install Ubuntu**.

   ![Install Ubuntu](https://i.imgur.com/Eej2n88.png)

2. Tick both **Download updates while installing Ubuntu** and **Install third-party software for...**

   ![Options](https://i.imgur.com/UB3frbP.png)

3. If everything went properly, you should have the option to **Install Ubuntu alongside Windows Boot Manager** or if you are using a clean hard drive/the virtual machine, select **Erase disk and install Ubuntu**. These two options set everything you need for the installation. 

4. > If neither of the first options apply to you, you will need to select Something Else and go on to the next step. 

   For the first two options, a dialog box will pop up, simply click **continue**.

   ![Install Alongside](https://i.imgur.com/tgurgp4.png)

   ![Simple Install](https://i.imgur.com/wriWeyn.png)

5. ***Skip this if you had the Install Alongside option***. If you did not have the install option, we will have to set the partitions manually. First, select the space we created earlier in the tutorial and click on the plus button.

   ![Partition](https://i.imgur.com/rwxkzQm.png)

   In the dialog box, select **Primary** **Beginning of this space** and change **Use as:** to **swap area**. The memory size should be two times the amount of RAM that your system has (i.e. 4GB if you have 2GB).

   ![Swap Creation](https://i.imgur.com/zzlk133.png)

   |      |
   | ---- |
   |      |

   ​

   After that, we're going to set up the root directory, which serves as the base for all files of Ubuntu. We are going to allocate the rest of the space remaining in **Free Space**. Set **Use as:** to **Ext4journaling file system** and **Mount point** to **/**.

   ![Root Partition](https://i.imgur.com/3qz2jb8.png)

   For the **boot loader installation** location, select the base hard drive. It should be the complete name with no numbers, such as /dev/sva. After that, click **Install Now** and the installation process for Ubuntu should be continue.

   ![Install Now](https://i.imgur.com/RDlpBEG.png)
   

6. Now set your location for language, keyboard, and time settings.

   ![Location](https://i.imgur.com/EC55JoP.png)

   ![Keyboard Settings](https://i.imgur.com/3zEsRI2.png)

7. Set up your user account. The password should be short and memorable but also hard to guess, we will be using it whenever we switch to administrative mode on terminals (which will be super often because we will be developing code). Here, you can also encrypt your home folder (which holds all the items you create/download).

   ![User Account](https://i.imgur.com/a44OvRu.png)

8. You can taste it now. Unfortunately, you'll be tasting it for a few minutes.

   ![Installing](https://i.imgur.com/5gOeQfp.png)

   Now that's what I call tasty

   ![Installed](https://i.imgur.com/8DLxl49.png)

9. Now just log in and Ubuntu has been set up!

   ![Final Screen](https://i.imgur.com/mU5a3Hk.png)

   ### 

# A Terminal Overview

There are a few discrepancies between Mac terminal and the Ubuntu terminal that are worth mentioning since the HABMC guides are written from the perspective of Mac.

1. **Ctrl+Alt+T** is the shortcut to open a terminal window. **Ctrl+Shift+V** is the shortcut to paste into the terminal, in every other program, it is **Ctrl+V** like Windows.

2. The administrator privilege is run by  **sudo**. This is required for installing or updating any packages you have on Ubuntu. For example, running

   ```bash
   sudo apt-get update
   ```

   would first request your password, then it would run the application getter (apt-get), to update all the packages you  have installed (update).

3. This function makes maintaining useful applications super easy, especially since our system will be 16.04 for a very long time. This insures stability and convenience, two very important parts of being a lazy programmer.

# Launching

Once this is set up, your machine will initially boot Ubuntu, which in turn loads Grub. From the Grub menu you can launch into Ubuntu or Windows depending on which you prefer.

# OI mate, don't ship me like this

With that over with, let's install [all the tools we need][]



[//]: # "The lonely link used in this guide"
[all the tools we need]: google.com/ "This will be the docker tools installation guide"

