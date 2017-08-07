## A lesson on pig anatomy
Pigs like Dudley have trotters, not hands, which means the natural counting system is base 2, or binary.
The pig emporium does operate in US dollars though, so Dudley needs a way to convert from base ten (what we use) to base two.
As a quick refresher, counting in binary looks like this:
```
0 ->     0
1 ->     1
2 ->    10
3 ->    11
4 ->   100
5 ->   101
6 ->   110
7 ->   111
8 ->  1000
9 ->  1001
10 -> 1010
```

## Files, requiring, I don't have a third thing, oh my!
As Dudley expands his emporkium, things are going to get awfully crowded if we keep sticking everything in the same file.
Let's create a new file, called `convert.rb`.
In it, we can just make a new function called `to_base_2` that takes one argument, number.
We can leave the body empty for now, so it will look like this:
```ruby
def to_base_2(number)
  # TODO: write this
  # By the way, you can make comments in ruby by beginning the line with a #
end
```

But now we want to be able to call this from `run.rb`.
There are two ways to do this: `require` and `require_relative`. 
They do the same thing, except `require` requires the path relative to where you're running the script, and `require_relative` requires it relative to the file it's called from.
In this case that's exactly the same, so let's just say, in `run.rb`
```ruby
require_relative 'convert'

puts to_base_2(4)
```

This gives us access to all the functions, modules, classes, etc defined in convert.rb.
`puts to_base_2(4)`, of course, will just print out the result of calling our conversion function with an argument of 4.

## A simple conversion algorithm
Converting a number into base two can be done by looking at each place: the 16s place, the 8s place, the 4s place, the 2s place, and the 1s place in that order.
For converting the number six, for example, we can go through a process like the following:
1. 6 < 16, so there's a zero in the 16s place
2. 6 < 8, so there's a zero in the 8s place
3. 6 >= 4, so there's a 1 in the 4s place. We've now accounted for a 4, which leaves us a remainder of 2.
4. 2 >= 2, so there's a 1 in the 2s place. We've now accounted for a 2, which leaves us a remainder of 0.
5. 0 < 1, so there's a zero in the 1s place.
Stick this together, and we get `00110` as our binary version.


## In ruby

The first step is to declare an array to hold the result. 
```ruby
converted = []
```
This just declares the variable converted (note that in ruby we don't need to specify a type), and sets it equal to an empty array.
While in some languages an array is of a fixed size, in ruby an array is much more like the Java ArrayList: it can expand to hold as many elements as we want.

Next we want to loop through the "decimal" places.
We can do this by looking at first 2^4, then 2^3, etc, so we need to get a loop that gives us the values 4, 3, 2, 1, 0.
```ruby
(0..4).reverse_each do |decimal_place|

end
```
`(0..4)` creates a range that goes from 0 to 4, inclusive, and then `reverse_each` loops through it in reverse order.
If you want to play around with that a little bit more, you can try doing things like:
```ruby
(0..4).reverse_each do |decimal_place|
  puts decimal_place
end
```
or try using `each` instead.
Iterators are one of the most powerful parts of ruby, so don't worry if the syntax looks a little funky at first.

Okay, now we need to do our check: if the current number or remainder is less than the n-place, just set that bit to zero.
Otherwise, we want to set that bit to a one and calculate the new remainder.
```ruby
# create a local variable called bit, with a value of zero
bit = 0

# 2**decimal_place calculates to the the power of decimal place. For example, 2**3 is 8 
if number >= 2**decimal_place
  bit = 1 # set the bit to 1
  number -= 2**decimal_place # and set our number variable to the the new remainder, by subtracting off 2^n
end
```

We also need to store the bit value in our `converted` array: the syntax for adding it on to the end of the array is just `converted << bit`.
Finally, at the end of the function, we need to `return converted`, which, big surprise, returns the `converted` variable.  

## All together now
We've jumped around a little. 
Here's what the full function should look like
```ruby
def to_base_2(number)

  converted = []

  (0..4).reverse_each do |decimal_place|
    bit = 0

    if number >= 2**decimal_place
      bit = 1
      number -= 2**decimal_place
    end

    converted << bit
  end

  return converted
end
```

This is ugly. [Let's go on to the next part to learn how to clean this up!](ruby-04.md)
