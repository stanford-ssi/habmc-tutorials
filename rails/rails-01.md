Getting started with Ruby on Rails will probably be a little easier if you know what Rails is.

Rails a collection of ruby libraries that make getting a website up faster than a cheetah could maul the mailman, assuming the cheetah was high on meth.
Imagine you had to write a server from scratch -- a connection to a database to store data, handling of requests and parameters, automatically compressing javascripts and stylesheets to be delivered to the browser -- Rails does it all. 
Let's get started

## Creating the rails project

With the same [Dockerfile](../ruby/Dockerfile) as the previous step, and running it with `docker run -v $(pwd):/home -it ruby-tutorial`, run:
```bash
gem install rails
``` 
This installs the rails libraries

Next, run:
```bash
rails new ham-mc
```
This creates a new rails project named ham-mc.
You can get right to running it in [the next part](rails-02.md), or you can stay around for the tour.
I recommend the tour.

## Exploring the app

If you look in the newly-created ham-mc directory, you'll see a number of directories and a number of files.
There are a lot (think about how much Rails does for you!), but in the course of this tutorial we'll get to know the important ones.
For now, let's go through one by one.
The ones we'll be using the most later on are most just `app` and `Gemfile`.

## Files

### .gitignore
You may be familiar with git, our system for storing our code and keeping it in sync across a bunch of different people.
If you're not, I recommend:
1. [git - the simple guide](http://rogerdudler.github.io/git-guide/) for a practical introduction of how to use it
2. [Try Git](https://try.github.io/levels/1/challenges/1) for an interactive tutorial.
We won't be using git in this tutorial, but we will in the next one.

In any case, the `.gitignore` file is a way to tell git to ignore some files.
For example, let's say you made a file like `personal_notes.txt`.
By default, it would get added to git and spread to any other coder who was working on the code with you.
You can turn that off by adding it to the gitignore.  

### config.ru
An entry file that gets used when starting the servers.

### Gemfile & Gemfile.lock
If you want to add another library to the project (or gem, as they're called in ruby), the Gemfile is the place to do it.
The Gemfile.lock is automatically generated and just makes sure that the version of each of those libraries stays "locked" and doesn't change out from underneath you.

### package.json
If we were using webpack, a javascript system, this would be the place to specify the javascript libraries. 
But we're not.

## Rakefile
Another entry file for running tasks (like changing the format of the database)

## README.md
This is an excellent spot to write documentation, but doesn't have an effect on the code.

## Directories

## app

### assets
Things that go to the "frontend" (the browser of the person viewing your website) go here. 
For example, you might put in images, a stylesheet that makes the site look pretty, or a javascript that makes the site interactive.
We'll be doing a lot of work in this folder.

### channels
Code that handles websockets goes in here.
Websockets are a way of having a channel for data to go back and forth between client and server (frontend and backend) stay open.
This is a lot lower overhead because the connection stays open, and lets the server send messages to the frontend.

### controllers

When a request comes in to the server, it goes to a controller.
The controller is responsible for doing things like redirecting unauthorized requests or preparing data to be rendered in the response.

### helpers
If a view (see below) needs to do something complex or repeatable, helpers are a good place to write that code.
For example, if you wanted to call a function that made a bright red button, you could write that function in a helper.

### jobs
Asynchronous jobs go in here.

### mailers
Code for sending emails goes in here.

### models
Models are the abstraction of data in Rails. 
For example, you might have a model `User`, which is responsible for holding a first name and a last time, and might have a method like
`full_name` which returns the full name.

### views
After the data is prepared in the controller, the view defines what the response actually is.
HTML files go in here.

## bin
This holds binary files used for running your code. 
You won't ever touch these files directly.

## config
Various application-wide configuration goes here.
For example, we could change the number of threads it uses by editing `config/puma.rb`.

We'll be paying a lot of attention to `config/routes.rb`

## db
Configuration of the database -- like how to load in initial data or a new field of data we want to store -- goes here.

## lib
If we wanted to write any libraries, like a tool that generates naughty-sounding euphemisms for the word avocado, we'd put them here. 

## log
Log files produced by rails will be stored here.

## public
This is where we could stick files to be served directly.
For example, there's a file there called `500.html`, so by going to `500.html` on the server, you would see that file.
It skips all the Rails layers and serves it as-is.

## test
This is where we would right automated tests of our code, if we weren't eggs and actually wrote automated tests.

## tmp
Rails uses this directory for temporary files and caches.
For the most part you can ignore it.

## vendor
This is a good place to stick code you didn't write, in order to keep it separate.
For example, you might put a javascript library in here.


Now run along to [Part 2](rails-02.md)
