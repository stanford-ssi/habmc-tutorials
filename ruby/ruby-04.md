We had a function that worked, but it didn't use the most elegant syntax.
Let's clean it up to use a bit nicer style.

First off, the last line of a ruby function doesn't need the return keyword explicitly.
If you're using IntelliJ, it will have highlighted this for you.

Another thing is that this returns an array (eg `[0, 0, 1, 0]`).
Instead, we want to return a string like `'0010'`. 
We can use the join function: `converted.join`.

Let's change the function to:
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

  converted.join
end
```

## Making it support higher numbers
Another problem here is that it only supports values up to 2^5 - 1.
`to_base_2 30` prints out `11110` correctly, and `to_base_2 31` prints out `11111`, but run `to_base_2` on 32 or anything higher will print out the same thing.
One solution is to add a check at the beginning of the function:
```ruby
if number >= 2**5
  raise ArgumentError, 'Cannot convert values of 2^5 or higher'
end
```  
This raises an error and stops the function from executing.

Of course, this isn't a very good solution -- we want to support arbitrarily high numbers.
There's a nice place to slot that in: where we have `(0..4)`, we just need to figure out what the highest decimal place is going to be.
I'll save you some math and tell you that we just need the ceiling of the log base 2 of the number.
For example, log_2(4) is 2, so we can put `(0..2)`. 
log_2(5) is 2.32, so we round up to 3 and would have `(0..3)`
To find out how to do this, you can google "ruby logarithm base 2" and "ruby ceiling function." 
You'll find we can write this as 
```ruby
Math.log2(number).ceil
``` 
Isn't ruby fun?

In any case, our function now looks like
```ruby
def to_base_2(number)

  converted = []
  max_decimal_place = Math.log2(number).ceil

  (0..max_decimal_place).reverse_each do |decimal_place|
    bit = 0

    if number >= 2**decimal_place
      bit = 1
      number -= 2**decimal_place
    end

    converted << bit
  end

  converted.join
end
```

In `run.rb`, you can test this out by adding things like `puts to_base_2(32)` or any other number you want.

## Leveraging the map function and learning irb
Remember how I said ruby iterators were super powerful?
Let's dig in a little to the map function.
It returns a new iterator with the results of calling the block on it, but since that sentence is incomprehensible techno-babble, let's look at an example.
```ruby
(0..10).map do |x|
 x * 2
end
# => [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
```
But do we really need to test out this snippet by putting it in run.rb, calling `ruby run.rb`, and having print statements all over the place?
By the fact that I asked this question you can probably guess the answer is no. 
Fire up the ruby interface by running
```bash
irb
```
This will bring up a console that lets you test out ruby snippets, which can be a useful debugging tool.
For example, try pasting in that snippet from earlier:
```ruby
(0..10).map do |x|
 x * 2
end
```

Anyway, we wanted to use this map function in our conversion.
Ruby is really cool in that it lets us chain iterators: we just say `reverse_each.map`

```ruby
def to_base_2(number)

  max_decimal_place = Math.log2(number).ceil

  converted = (0..max_decimal_place).reverse_each.map do |decimal_place|
    bit = 0

    if number >= 2**decimal_place
      bit = 1
      number -= 2**decimal_place
    end

    bit
  end

  converted.join
end
```

Okay, you're probably tired of this.
[Let's get back to Dudley's Pig Emporkium in the next section](ruby-05.md)
