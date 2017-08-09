## The fix
We needed to make it `(Math.log(number) / Math.log(base)).floor` instead of `(Math.log(number) / Math.log(base)).ceil`.
If you think about it, this makes sense: the lower decimal places hold enough memory to account for any remainder.
Our final output is:
```text
Running 100 tests
Tests complete
```

And our final code is:
```ruby
class Converter

  def initialize(number)
    @number = number
  end

  def to_base(base)

    number = @number

    max_decimal_place = (Math.log(number) / Math.log(base)).floor

    converted = (0..max_decimal_place).reverse_each.map do |decimal_place|
      bit = 0

      while number >= base**decimal_place
        bit += 1
        number -= base**decimal_place
      end

      bit
    end

    converted.map! do |digit|
      digit = ('a'..'z').to_a[digit - 10] if digit >= 10

      digit
    end

    converted.join
  end
end
```

## So what did we learn, kids?
Through the course of this tutorial, hopefully you've gotten a basic grasp on both ruby syntax and Dudley's Pig Emporkium.
You should know:
 - How to make a function
 - What string interpolation is and how to use it
 - How ruby iteration and if statements work
 - How to make classes
 - How arrays and hashes work
 
 Unfortunately, it's now time to move on.
 You can either go directly to [the rails tutorial](../rails/rails-01.md) or check out the [bonus ruby tutorial](ruby-bonus.md), which goes a teensy bit further into some of the things you can do with ruby.
