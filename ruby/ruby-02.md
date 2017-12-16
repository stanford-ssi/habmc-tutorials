## Hello world

Let's create a new file. 
Because we're suuuuper imaginative, we're going to call it `run.rb`, and place it in the same directory as the dockerfile from before.
Finally, we'll make the contents
```ruby
puts 'Hello world. We like to follow programming conventions'
```

Now, in your docker environment (which you got to in the previous step by running `docker run -v (pwd):/home -it ruby-tutorial`), run
```bash
ruby run.rb
```
Bonus points for guessing what that will do.

**For Ubuntu Users:** Rejoice, for we are no longer using pure Ubuntu. We're now in some bastardised, nightmare version of it that docker conjured up. However, this means we no longer have to use the sudo command before every single thing we run. Keep in mind, however, that we have to go back to using the sudo command once we return to our proper root (the **/** directory) from the docker root.

## Functions 
We have a serious problem: no overly convoluted story line to annoy you enough that you finish this tutorial out of spite.
From here on, this story isn't about Ruby. 
It's about Dudley, an enterprising young porker, and his store, Dudley's Pig Emporkium.
Annoyed yet? Perfect. That means you'll get through this tutorial faster.

When customers enter the store, Dudley wants to greet them properly. 
Now, he could just say hi, but he wasn't raised in a barn.
Let's make a function that takes a name as input, and prints out a greeting.
It will look a little something like this:
```ruby
def greet(name)
  puts "Hi #{name}! Welcome to Dudley's Pig Emporkium"
end
``` 
Stick that in your `run.rb`, followed by a call to it:
```ruby
greet 'Billybob Jenkins'
```

You can run this by running `ruby run.rb` again, but what's actually going on here? 
The function definition is pretty straightforward: the `def` keyword starts a function, it takes in one parameter called name, and continues until the `end` is reached. The Java equivalent might look something like:
```java
class Whatever {
    void greet(String name) {
        System.out.println("Hi " + name + "! Welcome to Dudley's Pig Emporkium");
    }
}
```
But there is one funky part about it: the `#{}` syntax.
That's string interpolation. 
Instead of needing to combine separate strings together, it just evaluates whatever is between the `{}` and sticks it in the string; in this case, it's just the `name` variable.

Calling it is done without parentheses.
It's perfectly valid syntax to put parentheses there or scatter semicolons about, but the general rule is don't do it unless it clarifies things.
For example `greet 'Jim'` is good, as is `greet make_up_a_name(length: 4, style: 'Silly')`.

## A quick note about strings, named parameters, and other syntactic sugar
Ruby is somewhat famous for having a lot of syntactic sugar: elegant little pieces of code that make your code readable.
Named parameters are an example of this: you can do a lot of things in a function definition, like being able to pass the arguments in any order, accepting any number of arguments, requiring some but not others -- the list goes on. 
As a rule, in this tutorial, we'll be using the simplest version possible, but don't be phased if you see something that looks a little weird.
As you gain more experience, you'll pick up all the small features that make programming in ruby such a pleasure.

One other thing worth noting is that there are several different ways of creating strings in ruby, which have subtly different features.
The main rule of thumb is to use `'Single quotes for simple things'` and double quotes for `variable = 'interpolation'; "String #{variable}"`. 
We'll talk a little more about this later, but follow that rule and things should be nice and happy. 

## Sections are fun
But it's time to go to the next part, and sink our teeth into something a little more meaty. 
[Onwards!](ruby-03.md)
