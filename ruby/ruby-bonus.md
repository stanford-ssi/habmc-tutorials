Wouldn't it be cool if we didn't have to make a whole new class, and could just say something like `23.to_base 2` and have it work?
Luckily ruby _is_ really cool, and we can do just that.
This is a technique called monkey patching, and can be both useful and dangerous.

Change your convert.rb to look like the following.
It's exactly the same as before, except we're editing the `Integer` class directly and instead of referencing `@number` we reference `self`.

```ruby
class Integer
  def to_base(base)

    number = self

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

You can now change your test in `run.rb` to look like:
```ruby
test[:number].to_base test[:base]
```

Or just play with it directly.
```ruby
puts 12.to_base(6)
```

In general, when monkey-patching, it's good to use _refinements_, which limit the scope of the patch.
This prevents bugs when other libraries might have redefined functions for themselves.
[You can learn how to do this here](https://blog.alex-miller.co/ruby/2017/07/22/scope-the-monkey.html), but only if you want.
HABMC doesn't use this -- I just thought it was a really cool example of Ruby's flexibility. 


## The standard libraries

Of course, one other really great thing about ruby is how powerful its existing libraries are.
If Dudley had just googled "ruby number to base", he would have found that the `to_s` (to string) method already does exactly what we want:
```ruby
puts 12.to_s(6)
``` 

Of course, that wouldn't have been nearly as fun. 
I hope you enjoyed this tutorial, and I'll see you in [the rails one!](../rails/rails-01.md)