Welcome to the final tutorial: Learning HABMC. 
HABMC is a pretty massive codebase, so we won't be able to cover everything -- but hopefully this will help you get oriented and ready to work!

## Getting HABMC
First, poke Kai on slack (@kai) to get access to the repository. 
The code is kept private, so you won't be able to do anything until you get to this step.

I'm going to assume that you've completed the previous tutorials, so have docker already.
You'll also need [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git), which on mac you can usually get by running git and following the instructions.

Clone the repository with
```bash
git clone https://github.com/KMarshland/habmc
```
This downloads the codebase.

Then navigate into the habmc directory
```bash
cd habmc
```

Then run the install script
```bash
docker-compose run app bash install.sh
```

Now try starting the servers
```bash
docker-compose up
```

You should be able to go to [http://localhost:3000](http://localhost:3000) and see HABMC in all its glory.
If you aren't, talk to Kai; otherwise, go on to [Part 2](habmc-02.md)
