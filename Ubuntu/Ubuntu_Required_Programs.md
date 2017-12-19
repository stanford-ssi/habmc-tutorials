# On The Edge

Now all that is left to do is install some of the programs we require for HABMC. We'll start with the easier ones first.

### Git

Open up a terminal and type

```sudo apt install git```

Watch the magic happen, and we're done.

### Docker

The docker instructions here are ripped from [the official docker documentation][]. If you want to read more about what the code does, I would recommend checking it out. Otherwise, we'll try to keep this concise.

Some more typing, but a little more intense this time. First we need to set up the repository from which we pull docker code.

```sudo apt-get remove docker docker-engine docker.io```

```sudo apt-get update```

```
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
```

```curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -```

```sudo apt-key fingerprint 0EBFCD88```

The following command should not output anything, there is no need to worry.
```
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable" 
```

With our repository set up, we can move on to actually installing docker.

```sudo apt-get update```

```sudo apt-get install docker-ce```

```apt-cache madison docker-ce```

```sudo apt-get install docker-ce=<VERSION>```

Now we need to test that everything was set up correctly, run

```sudo docker run hello-world```

and the following should pop up in your terminal.

![Docker Is Good](https://i.imgur.com/lhk84Ap.png)

### Docker Compose

As a disclaimer, this program has to be installed after downloading Docker. However, it is slightly easier to download than Docker itself. This will be version 1.18.0, it is compatible with the tutorials, however I would recommend downloading the most recent version by following [the instructions here][]. Just click on the **Linux** tab under the **Install Compose** heading.

```
sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
```
```
sudo chmod +x /usr/local/bin/docker-compose
```

Typing in the command ```docker-compose --version``` should return version 1.18.0 if everything was installed properly.


### IntelliJ
This is where things get slightly more difficult, but it's good exposure to the file types we will be using in Ubuntu. IntelliJ is the holy grail of IDEs (integrated development environments) in terms of features, but the best part is that it's ***free for students*** It doesn't get much spicier than that. (I'm looking at you, matlab). Simply make an account on [the IntelliJ website][] and verify your email. Once you have the program installed, it will prompt you for a login.

1. Now that we have an account, we'll want to go to [their website][] and download the **Ultimate** edition with JDK, so just .tar.gz and make sure to save the file, not open it. .tar.gz files are the equivalent of combining .zip and .exe files from windows, they are used to compress installable programs and make them easily downloadable.

![IntelliJ Install](https://i.imgur.com/eEGl1ba.png)

2. After that's downloaded, find the folder where it's located and double click it. From this menu, click extract and select your home directory by clicking on your **home folder** and then clicking **extract**.

![Install Path](https://i.imgur.com/umQIFcY.png)

3. Now we need to cd into the bin folder (i.e. enter the bin folder with the terminal). There are two ways to do this, first with a terminal and second by right clicking. We'll go through both ways.

    * With the terminal: First, open a new terminal window and type in the location of the bin folder. When doing this on your own, it is easier to go one step at a time as pressing tab twice after typing cd will show us all potential paths at each cd. For my particular computer and folder set up, the path was.
    ```
    cd idea-IU-173.3942.27/bin
    ```
![Proper cd path](https://i.imgur.com/SX1q4Lv.png)
In the first cd, I pressed tab twice after typing cd. This displayed all the paths in my **home folder** that I could have used cd to get into.

Alternatively, you could right click the bin folder from within the folder you extracted. Then click open in terminal.
![Right Click Option](https://i.imgur.com/6HCOxIs.png)

Once you are in the proper path, type

```
./idea.sh
```

This will start the installer, simply follow the instructions and use the default settings. Choose whichever theme and style you prefer. (Darcula master race). After that, you have IntelliJ installed. Once it launches, you'll want to right click and select **Lock to Launcher** in order to have quick access to it. If you didn't do this, opening it would involve clicking on the topmost icon on your taskbar and typing in IntelliJ.
![Lock to Launcher](https://i.imgur.com/3z4iUXI.png?1)

As an aside: Whenever you are downloading programs from .tar.gz, there should always be a **readme.txt** or something similar with installation instructions. Always follow these as the process for installing programs can be very different from this. In this case, it was **Install-Linux-tar.txt**.
![Readme.txt](https://i.imgur.com/wQlBJSt.png)


##### Method Two: 
This is a lot more straight forward but doesn't teach you as much about Ubuntu. Click the topmost icon on your task bar, which should be **Search your computer** and look up **Ubuntu Software**. Once that is open, just search up **IntelliJ** and install the first program. You will need to make an account in order to download it using this method.
![Ubuntu Software](https://i.imgur.com/nyXnC96.png)


# Time to Pop the Champagne
That's everything we need for the tutorials. It's bittersweet seeing you guys graduate, but the first time installing Ubuntu is a long process. Hopefully this guide made it a little shorter, and prevented you from having to Google things for a cumulative totale of 30ish hours :mildscorn:. It's bittersweet seeing you graduate, but I'm sure you'll go on to do great things for HABMC and SSI. Hope to see you soon [in the first tutorial][]!

If anything is strange, breaking, doesn't quite work, just Slack me (Hector Amador) `@implyingicheck`



[//]: # (Some viruses needed for the guide)

[the official docker documentation]: <https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/>
[the IntelliJ website]: <https://account.jetbrains.com/login>
[their website]: <https://www.jetbrains.com/idea/download/#section=linux>
[in the first tutorial]: <https://github.com/stanford-ssi/habmc-tutorials/blob/master/ruby/ruby-01.md#ubuntu-and-me>
[instructions here]: <https://docs.docker.com/compose/install/> "The docker compose install steps"
