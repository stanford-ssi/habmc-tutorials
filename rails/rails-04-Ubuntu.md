
Hey, so I kind of misled you earlier. But it's alright, we can go back to our loving, wholesome relationship after I tell you this dark secret. First, open up the terminal that is running **ham-mc** and **Ctrl+C** to close out the server.

Now, let's go to the folder where **ham-mc** is located. **Ctrl+C**, **Ctrl+V** it and magic happens. We just became the author of this new file, which means we can just double click to open things and edit them instead of having to use the terminal commands.

![Copying Files](https://i.imgur.com/PeVIKLA.png)

So now you might be thinking, "how could I ever trust this asshole again?" and that's a very valid question, especially after going through the hell that is terminal editing. Here's my best attempt at an excuse: these Ubuntu guides are essentially another tutorial on how to use the opearting software at a basic level.

Some time in your Ubuntu career, you'll stumble upon read-only files. The biggest reason files are read-only is for security. While you could use the method we did above, it can some times put your computer at-risk or break the program that you are working with because of permission inconsistencies. Now, you have the tools to work around read-only files and hopefully are starting to become more comfortable using the terminal.

Before you think about how BS that is, [let's get back to installing bootstrap](rails-04.md#adding-bootstrap).

### Server Is Already Running Error

The reason this specific breakage happens is because the server was running when we copied the files.

Since the files are exact copies of everything, **docker-compose** cannot tell the difference between the two servers. When you tried ```docker-compose up --build``` on the copy, it told you that a server is already running and close out the copy version because the Server.pid file said so. Unfortunately, docker-compose isn't smart enough to figure out that the server isn't actually running.

Fortunately, this has a quick fix. We'll want to delete the instance of the server.pid (which is the identification number associated with the rails server). Open up **ham-mc (copy)/tmp/pids** and delete the file named **Server.pid**.

![Server.pid Location](https://i.imgur.com/LZvUNx8.png)

and now run

```bash
sudo docker-compose up
```

and ham-mc should launch up properly now. Now let's [continue the tutorial](rails-04.md#adding-bootstrap).
