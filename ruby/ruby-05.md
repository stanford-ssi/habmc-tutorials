"Wait a second," thinks Dudley. 
"I may be trapped in a convoluted excuse for a programming tutorial, but that doesn't mean I can ignore pig anatomy!"

Pigs have two toes on each trotter.
That makes the logical base system base 4, or perhaps base 8 because they have four legs.
If I've learned one thing as a programmer, it's that the demands of the user are ever changing, so let's just make it support any base system.

## The new algorithm
The same fundamental algorithm works, except everywhere we have a 2 we should be using a variable.
Let's make our function `to_base` take in another argument, base, and replace all our twos with that.
We also need to make it log base n, instead of log base 2. 
We can do this by dividing by the log of the base itself: `max_decimal_place = (Math.log(number) / Math.log(base)).ceil`.

That makes our full function look like
```ruby
def to_base(number, base)

  max_decimal_place = (Math.log(number) / Math.log(base)).ceil

  converted = (0..max_decimal_place).reverse_each.map do |decimal_place|
    bit = 0

    if number >= base**decimal_place
      bit = 1
      number -= base**decimal_place
    end

    bit
  end

  converted.join
end
```   

There's a problem though.
Each "bit" is no longer limited to just a zero or a one. 
Instead, we need to count the number of times that place is filled.
We can do this with a while loop.

```ruby
def to_base(number, base)

  max_decimal_place = (Math.log(number) / Math.log(base)).ceil

  converted = (0..max_decimal_place).reverse_each.map do |decimal_place|
    bit = 0

    while number >= base**decimal_place
      bit += 1
      number -= base**decimal_place
    end

    bit
  end

  converted.join
end
```

## Making it a class
This conversion is very well and good, but we need an excuse to learn classes anyway.
Let's make a class called `Converter`.
This is as simple as 
```ruby
class Converter
    # ... 
end
```

Let's also make it have a constructor that takes in one argument, the number it will be converting, and store that.
A constructor, as a quick refresher, is something that creates a new instance of the class.
The class is like a generalized template, and the constructor is what makes a new version.
```ruby
class Converter

  # a constructor is done by making a method called initialize
  def initialize(number)
    # a variable beginning with a @ is an instance variable, which means it sticks around from function to function
    @number = number
  end
  
end

# Now we can run Converter.new(2) to create a new converter that has its number variable set to 2
```

## Making it actually do something
Having just a class that remembers a single variable is pretty useless.
Let's stick in our `to_base` function.
Of course, we don't want to take a number as an argument -- we want to use the number from before.
So let's take out the number parameter, and make a local variable `number = @number` (since we change it in the function, we want to have a copy of it, or the conversion would only work once).

```ruby
class Converter

  def initialize(number)
    @number = number
  end

  def to_base(base)

    # assign the local variable to a copy of the instance variable
    number = @number

    max_decimal_place = (Math.log(number) / Math.log(base)).ceil

    converted = (0..max_decimal_place).reverse_each.map do |decimal_place|
      bit = 0

      while number >= base**decimal_place
        bit += 1
        number -= base**decimal_place
      end

      bit
    end

    converted.join
  end
end
```

In `run.rb` you can have something like
```ruby
require_relative 'convert'

puts Converter.new(4).to_base(2)
```

[On to the next part!](ruby-06.md)
