I lied, sorry.
You see, I'm not actually going to start with the ruby programming language.
I'm actually going to start with the tools we need in order to start programming in the ruby programming language.


## Install ALL the things

This starts with a nice editor. 
I recommend [https://www.jetbrains.com/idea/](https://www.jetbrains.com/idea/), which has support for ruby, rails, javascript, docker, and pretty much every language/framework you can think of.
Technically you're free to use another editor, but this whole thing will be easier and you're much more likely to have nice style if you use IntelliJ.
Note that you should get IntelliJ **Ultimate** rather than the community edition.

Have you downloaded it? Nice. The enterprise version is free for students, and you can use most of the defaults. 
The plugins that will come in handy are for Ruby and Docker. 

Next up, Docker.
Docker is going to be our way around having to worry about getting everything installed correctly on your computer. 
It's a container system -- a bunch of commands that set up something reliable and consistent on your computer -- which means that instead of wasting our time with 15 things, we only need to worry about one. 
You can install it from [docker.com](https://www.docker.com/docker-mac)


## Make the Dockerfile

Alright, I'm going to assume you have IntelliJ and Docker up and running.
Let's create a new folder someplace, and open that folder in IntelliJ.
Now, we'll make a dockerfile.
This is as simple as right clicking in IntelliJ and creating a new file with the name `Dockerfile` (with no extension).
Make the contents of it look like the [Dockerfile in this folder](Dockerfile):
```dockerfile
FROM ruby:2.4

WORKDIR /home
RUN echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_8.0/ /' >> /etc/apt/sources.list.d/fish.list && \
    apt-get update && \
    wget -qO - http://download.opensuse.org/repositories/shells:fish:release:2/Debian_8.0/Release.key | apt-key add - && \
    apt-get update && \
    apt-get install -y fish

CMD fish
```
You can see an explanation of what's going on by reading the comments in the [Dockerfile in this repo](Dockerfile)

### It's not working -- what do I do?
1. Make sure there's a file called `Dockerfile` -- with no extension!
2. Make sure [Docker is installed](https://docs.docker.com/get-started/#setup) and you can run `docker run hello-world
`
3. Slack `@kai`

## Build the docker container

Now it's time to open up terminal or your command line of choice.
I highly recommend installing [fish](https://fishshell.com/) on your computer -- it's an autocomplete for your shell, and installed in your docker instance.
Navigate to wherever you have your folder with the dockerfile; if it were in a folder called beans on your desktop, you could run `cd ~/Desktop/beans` to get there. 
If you want to get more comfortable with the shell, I liked [this tutorial](https://computers.tutsplus.com/tutorials/navigating-the-terminal-a-gentle-introduction--mac-3855)

Run `docker build -t ruby-tutorial .`
This builds the docker container (`-t ruby-tutorial` tags it with the name ruby-tutorial, and `.` just means build the current directory).
This might take a long time to run the first time, but you only will need to run it once.

## Run the thing!
```bash
docker run -v $(pwd):/home -it ruby-tutorial
```
Just run that command.
If you have fish installed you'll want to run `docker run -v (pwd):/home -it ruby-tutorial` instead.

This runs the ruby-tutorial app we built in the previous step. 
But wait, you ask, what's the deal with that whole `-v` garbage?
That mounts the local folder (try running `pwd` in your shell) to the `/home` directory in the Docker app.

This has stretched on long enough. 
[Let's go to the next part of the tutorial!](ruby-02.md)  

