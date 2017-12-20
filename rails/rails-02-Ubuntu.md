# Setting Up Ruby on Rails

Here is [a quick run down](../Ubuntu/Using_Ubuntu_Advanced.md) on commands that will be useful in the following section. If you want to know how these commands work instead of just going through the process, I would recommend reading that guide. Otherwise, let's start:

At this stage, we should have used our last ruby instance to ```gem install rails``` and then used ```rails new ham-mc``` to create a folder called **ham-mc** with the rails starter pack set up.

The **ham-mc** folder should look like:

![ham-mc Folder](https://i.imgur.com/7ub6f8U.png)


### Setting Up Docker

cd here form the terminal, then we'll run

```bash
sudo touch Dockerfile
```

```bash
sudo touch docker-compose.yml
```

These two commands create the Dockerfile and docker-compose.yml that we will need to properly set up the server.

Now, we want to edit the files so we run

```bash
sudo gedit docker-compose.yml
```

and change the text to

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

After saving the folder, run

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

### Editing the Gemfile

Finally, we'll want to open up the Gemfile that was located in our folder.

```bash
sudo gedit Gemfile
```

Then, find the line that says **# gem 'therubyracer', platforms: :ruby** and uncomment it by deleting the pound sign (#).

![Gemfile](https://i.imgur.com/pWdsSfu.png)

### Setting Up the Server

At this point, your server folder should look like this:

![ham-mc Folder](https://i.imgur.com/n1V7oMF.png)

After that prep work, all that's let to do is run the folder. Just use

```bash
sudo docker-compose up --build
```

and your server should set up!

![docker-compose Rails](https://i.imgur.com/FriwwD2.png)


The server will be accessible by going to [localhost:3000](http://localhost:3000). Here, you should see a rails welcome page.

Now we'll get to actually doing stuff in [Part 3](rails-03.md)!