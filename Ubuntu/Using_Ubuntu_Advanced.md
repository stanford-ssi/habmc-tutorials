# Quick Ubuntu Run Down

This will be a quick library of useful Ubuntu features for the tutorial. Hopefully you are starting to feel a bit more comfortable using Ubuntu at this point. Without a further ado, let's get into the deep of it:

### Creating files

If you have proper access to a file, the easiest way to create a new file is simply right clicking on the folder where you wish to create it and select **New Folder** or **New Document**.

![Example Right Click](https://i.imgur.com/EmvfTEB.png)

However, things get a bit tricker when files are read-only or were created using root (sudo). Thankfully, reating a file using the terminal is made simple using the `touch` command. Open up the location of where you want to create the file and open that location in a terminal. Then, use the command

```bash
sudo touch "file_name"."extension"
```
For uses of touch outside of this tutorial, [go here][].

As an example, I created two files in a folder called **Example Folder** to show you the different usage of including sudo. Without sudo, we created a file called **README.txt** and with sudo, **SUDOREADME.txt**. Each has different properties:

![Terminal Example](https://i.imgur.com/MXEfqyW.png) ![Example Folder](https://i.imgur.com/DxTAZAF.png)

* **README.txt** can be opened and edited without root access (sudo) being used. This is often the safest way to create files as most programs do not default to asking for root access.

* **SUDOREADME.txt** has a small lock on the file icon, this signifies that it is read-only. For our purposes, read-only roughly means that opening the files would require you to use the terminal, which we'll [cover here](#editing-files).

### Editing Files

The easiest way to edit files is by having an appropriate editor installed.

Here, I'm opening a **.png** using an image editor named **Pinta**.

![Right Click Example](https://i.imgur.com/aNks3gr.png)

We can open **README.txt** that we [created earlier](#creating-files) by double clicking it. This will bring up a blank document where we can type whatever we wish and save by clicking on the top right or hitting **Ctrl+S**.

![README](https://i.imgur.com/NiWaAUs.png)

Trying to do the same thing on our **SUDOREADME.txt**, however, doesn't quite work. The save button is greyed out, **Ctrl+S** doesn't work, and choosing **save as** after attempting to close the window returns the following error.

![Error Message](https://i.imgur.com/Sjjw44f.png)

This brings us into the world of root access and how Ubuntu is such a safe system. If you want more information on root access, [click here](#ubuntu-root-access). Otherwise, here's the solution:

If you have a read-only file, things will have to be done through the terminal. Using the files we created in the [last part](#creating-files). We'll open the **.txt** with a preinstalled program called **gedit**. Think of it like Notepad in Windows, except you can open any file type and edit the text associated with it (which can be a bunch of weird symbols if the document is not a text document).

Here is the example picture opened using gedit:

![Example Picture Textfile](https://i.imgur.com/Pqo5ZcN.png)

Looks like a fun time

Moving on, let's run gedit on our **SUDOREADME.txt**

```bash
sudo gedit README.txt
```

![gedit](https://i.imgur.com/q4NfyX5.png)

This will open the same program as earlier, but this time we will have the privilege of editing the documnet. At this point, we write whatever we would like:

![Edited SUDO](https://i.imgur.com/6MfJm3t.png)

## Ubuntu Root Access

Ubuntu has to be a very safe operating system for a couple reasons:

1. Most of the program downloads/updates happen in the background (through repositories)
2. A lot of developers use Ubuntu as their primary system, so a lot of sensitive code is run by the OS
3. It was a brand new OS at one point, any large breach in security would have meant the death of Ubuntu

Ubuntu accomplished this security through permissions, which is the go to method that humans have. The permission, known as root access, limits programs to only being able to write or edit ***vital*** system files after the system admin approves of it. In Ubuntu, we need to approve the edit/write request using **sudo** before the command and then enter our password.

On the flip side of this, whenever programs create containers (such as Docker), we need to use their root access to edit files. For example, when we create a **rails file**, we have to access it through the terminal because it is read-only. Docker creates this file as if it were its own OS, since the file is vital, it is protected by read-only. In other instances, we would never be able to edit this outside of Docker, however we need to run **docker-compose** from our Ubuntu system. We can do this by essentially forcing ourselves into the file.

As outlined in [creating files](#creating-files) and [editing files](#editing-files), we use sudo to open and edit these files. This works because Docker sits on top of Ubuntu, meaning Ubuntu has access to Docker but Docker cannot access Ubuntu except through a permission-controlled protocol.




[//]: # (Some links)

[go here]: <http://www.linfo.org/touch.html>
