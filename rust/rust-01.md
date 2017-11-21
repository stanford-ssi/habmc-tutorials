*While this doesn't directly build on the other tutorials, you should probably read them first -- this one is written at a slightly more advanced level*

Hey Kai, why can't we work in normal languages like C++?
It all gets back to when I was zapped with a horrible mind-control ray (flying on a Dudley's Pig Emporium-brand satellite) that left me unable to program in normal languages -- or wear turquoise party hats.

Well, it might actually be because I like elegant programming languages.
Ruby is a beautiful language to program in, but much like python, it's a high-level, interpreted programming language and thus worse for extremely computationally-intense problems. 
That means that for something like our prediction algorithms, which have to process a ton of data, and process it fast, we need a compiled language.
I chose Rust for a number of reasons:
- It's lightning fast (as fast as C, or faster on some benchmarks)
- It's designed to prevent memory leaks
- Everything is thread safe, and we wanted the ability to massively parallelize our code.
- I actually like the syntax
- It integrates really easily with ruby

Rust is still a young programming language, and there's a pretty steep learning curve. 
I say that not to discourage you, but so you know what you're getting into: it's okay if you don't immediately understand everything.
And as per usual, always feel free to ask me questions.

## Let's get started
Much like in the HABMC tutorial, we're going to do everything through Docker.
Let's make a Dockerfile based on rust that looks like:

```Dockerfile
# base it off of the rust image
FROM rust:1.20.0

# install fish for this OS
RUN echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_8.0/ /' >> /etc/apt/sources.list.d/fish.list && \
    apt-get update && \
    wget -qO - http://download.opensuse.org/repositories/shells:fish:release:2/Debian_8.0/Release.key | apt-key add - && \
    apt-get update && \
    apt-get install -y fish

# do everything out of the folder /home
WORKDIR /home

# start the fish shell running
CMD fish
```

And a `docker-compose.yml`
```yaml
version: '3'

services:
  app:
    build: .
    command: cargo run
    volumes:
      - .:/home
```

This sets up an environment with Rust installed.
Get into our shell by (in terminal) running:
```bash
docker-compose run app fish
```

And we'll move on to [the next step](rust-02.md)
