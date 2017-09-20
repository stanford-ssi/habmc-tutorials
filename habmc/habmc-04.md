Let's code!
Wait, we have to have an idea?
Well then -- let's write a system to send messages to the balloon, pretending that that's not a feature that already exists.
This is a tutorial.
Deal with it. 

## Mapping out what we want to make
In general, it's good practice to, well, know what you're doing.
Here are the features we need implemented:
1. A place to send messages: just an input and a submit button
2. A place to see sent messages, in a table
3. A backend that stores the messages
4. Once a message is saved, it should make a post request to https://httpbin.org/post, in simulation of sending the message to the balloon.

## Checking out to a new branch

We use a concept called feature branches, enforced by the Github. 
Instead of coding directly on the branch master, you code on a new branch, and, once the feature is done, you make a pull request to get it merged in (more on that later).
This ensures that master always has code that works so fixing bugs is easy, and that code can be reviewed properly.
Lets create and switch to a new branch (with your-name replaced by your name, to avoid conflicts).
```bash
git checkout -b tutorial-your-name
```

## Making the model
Let's create a message model.
Because there's already a model named message, let's call it TutorialMessage.
It should have:
- contents, a string, representing the contents of the message
- status, a string, either unsent, sending, success, or failure
- mission, a foreign key connecting it to a mission

We can make this with
```bash
docker-compose run app rails g model TutorialMessage contents:string status:string mission:belongs_to
```

We should also give the status a default of unsent.
We can do this by going into the db/migrate folder, and opening up the last file in it.
It should have a name like 20170920033542_create_tutorial_messages.rb, although it will have a different date.
Change the line `t.string :status` to
```ruby
t.string :status, default: 'unsent'
```

Finally, migrate the database with
```bash
docker-compose run app rails db:migrate
```

## Adding some validations
Let's make sure all the fields are present.
You may remember how to do this from the rails tutorial.
In your newly created model, app/models/tutorial_message.rb, add the following validations

```ruby
validates :contents, presence: true
validates :status, presence: true
validates :mission, presence: true
```

Let's also add a validation that the status is one of the allowed values
```ruby
validates :status, inclusion: { in: %w(unsent sending success failure),
                                  message: '%<value> is not a valid status' }
```

## Check it in to git
This is enough for one commit.
A commit is like a checkpoint in your code that lets you save what the state was at that point, and the bread and butter of git.
Let's add everything we've changed so far to this commit
```bash
git add -A
```

And commit it with a nice message that explains what we did.
```bash
git commit -m 'Created the TutorialMessage model'
```

And now on to [part 5](habmc-05.md)