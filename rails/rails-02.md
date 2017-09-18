From here-on out, every command should be run from the `ham-mc` directory, and just in your normal shell.

## Setting up Docker

We could create another Dockerfile, but it's high time we learned Docker Compose.
This is a system that lets us avoid memorizing incredibly complex Docker commands and instead lets us remember incredibly complex Docker Compose commands.
Seriously though, it does make things a lot simpler: the only two commands you'll need to know are `docker-compose build` and `docker-compose up`
Best of all, it comes already installed with Docker.

Let's start by making a file in `ham-mc` called `docker-compose.yml`.
This defines the docker configuration -- make it look like the following

```yaml
version: '3'

services:
  app:
    build: .
    command: rails s
    volumes:
      - .:/home
    ports:
      - 3000:3000
```

This tells it to have one docker service running, app, that gets built from the local directory.
It will mount the local directory, which means it sees the file changes you make on your computer, and it maps your port 3000 to the port 3000 in the app.
It also starts it with the command `rails s`, which starts the rails server.

### New Dockerfile
Just like last time, we need to make a Dockerfile so that it knows how to build the project.
Let's make it look like
```dockerfile
# base it off of the ruby 2.4 iage from dockerhub, which installs ruby and gets that set up
FROM ruby:2.4

# install fish for this OS
RUN echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_8.0/ /' >> /etc/apt/sources.list.d/fish.list && \
    apt-get update && \
    wget -qO - http://download.opensuse.org/repositories/shells:fish:release:2/Debian_8.0/Release.key | apt-key add - && \
    apt-get update && \
    apt-get install -y fish

# do everything out of the folder /root
WORKDIR /home

# install all libraries
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

# start the fish shell running
CMD fish
```

## Running the server
Run `docker-compose up --build`. 
This builds and runs everything.

Now go to [localhost:3000](http://localhost:3000) and you should see a welcome message.

Next up, actually doing things. 
See you in [Part 3](rails-03.md)