## Testing, testing

When something goes wrong with the algorithm, Dudley wants to know about it.
The solution is automated tests: a series of inputs and outputs that we know are correct.
Ruby has lots of great testing frameworks like rspec, but today we'll be making our own as an excuse to learn a tiny bit more about arrays and hashes.

For our testing suite, we want to store an array of test cases.
Each test case will have a number, a base it's converting to, and the expected output.
Running the test will be as simple as looping over the test cases and comparing the real output to what we expected.
Now, we could make a whole new class called test case, but in this case that's overkill.
It's much cleaner and easier if we just use hashes.
In ruby, we can declare a new hash like so:
```ruby
test_case = {
  number: 4,
  base: 2,
  expected: '100'
}
```
The hash is a key-value lookup table like a dictionary, where the keys and the values can be whatever you want.
In this case, the key `number` is associated with the value `4`, the key `expected` is associated with the value `'100'`, etc.
You can read and write from it using brackets (this is a great thing to stick into `irb` to test out)
```ruby
hash = {}

hash['hi'] = 'there'
hash['hi'] # => 'there'

hash[8] = 'eight'
hash[8] # => 'eight'

hash['false'] = false

puts hash.inspect
```


## Strings versus symbols
If you try running the following, it will print nil -- that is, it can't find the key number in the hash.
How do we read the value back out?
```ruby
test_case = {
  number: 4,
  base: 2,
  expected: '100'
}

test_case['number'] # => nil 
```

This is the difference between strings and symbols.
A symbol is an immutable string; an ordinary string like `'a'` can have `'b'` added onto the end of it in the same structure, but the symbol `:a` is much more like the number `4`.
Sure, you can create a new symbol `:ab`, just like you can create a new number `41`, but it's a different symbol than before.
This lets the computer do a lot of fun things under the hood and makes them better hash keys, which is why ruby makes them the default when declaring a hash literal.

You can declare a hash with the `:` symbol, or `:''` if it has spaces in it.
```ruby
this_is_a_symbol = :hi
here_is_another = :'life in the city'
```

Getting back to our test, we can access it with a symbol.
```ruby
test_case = {
  number: 4,
  base: 2,
  expected: '100'
}

test_case[:number] # => 4 
test_case[:base] # => 2 
test_case[:expected] # => '100' 
```

## Writing the test
Let's make an array of hashes called `test_cases`.
Well, one hash for now -- the same one as before.
Let's make it print out how many tests it's running using string interpolation and `test_cases.count`, then have it loop through the tests using a block like
```ruby
test_cases.each do |test|

end
```
Then, for each test let's using our `Converter.new(   ).to_base(   )` from before to convert it and compare it to the expected output.
If they're different (which we can check with a statement like `unless a == b`) we should print out a message saying it failed on that test.
I highly recommend that you try writing this on your own instead of pasting in the code below, but the code below is there if you really want it.

```ruby
test_cases = [
    {
        number: 4,
        base: 2,
        expected: '100'
    }
]

puts "Running #{test_cases.count} tests"
test_cases.each do |test|
  output = Converter.new(test[:number]).to_base(test[:base])
  unless output == test[:expected]
    puts "Failed to convert #{test[:number]} to base #{test[:base]} (got #{output}, #{test[:expected]} expected)"
  end
end
puts 'Tests complete'
```

## Running the tests
Since we just had this in run.rb, we can use `ruby run.rb` to run it.
```text
Running 1 tests
Tests complete
```
Looks like it worked!
Let's add some more test cases.

```ruby
test_cases = [
    {
        number: 322,
        base: 16,
        expected: '142'
    },
    {
        number: 187,
        base: 2,
        expected: '10111011'
    },
    {
        number: 748,
        base: 20,
        expected: '1h8'
    },
    {
        number: 166,
        base: 22,
        expected: '7c'
    },
    {
        number: 883,
        base: 16,
        expected: '373'
    },
    {
        number: 217,
        base: 32,
        expected: '6p'
    },
    {
        number: 447,
        base: 24,
        expected: 'if'
    },
    {
        number: 507,
        base: 13,
        expected: '300'
    },
    {
        number: 800,
        base: 20,
        expected: '200'
    },
    {
        number: 188,
        base: 20,
        expected: '98'
    },
    {
        number: 665,
        base: 10,
        expected: '665'
    },
    {
        number: 861,
        base: 34,
        expected: 'pb'
    },
    {
        number: 425,
        base: 30,
        expected: 'e5'
    },
    {
        number: 868,
        base: 29,
        expected: '10r'
    },
    {
        number: 930,
        base: 14,
        expected: '4a6'
    },
    {
        number: 979,
        base: 21,
        expected: '24d'
    },
    {
        number: 806,
        base: 3,
        expected: '1002212'
    },
    {
        number: 755,
        base: 21,
        expected: '1ek'
    },
    {
        number: 12,
        base: 10,
        expected: '12'
    },
    {
        number: 586,
        base: 17,
        expected: '208'
    },
    {
        number: 663,
        base: 36,
        expected: 'if'
    },
    {
        number: 964,
        base: 34,
        expected: 'sc'
    },
    {
        number: 750,
        base: 36,
        expected: 'ku'
    },
    {
        number: 731,
        base: 8,
        expected: '1333'
    },
    {
        number: 874,
        base: 9,
        expected: '1171'
    },
    {
        number: 613,
        base: 28,
        expected: 'lp'
    },
    {
        number: 487,
        base: 36,
        expected: 'dj'
    },
    {
        number: 998,
        base: 14,
        expected: '514'
    },
    {
        number: 9,
        base: 12,
        expected: '9'
    },
    {
        number: 181,
        base: 10,
        expected: '181'
    },
    {
        number: 523,
        base: 34,
        expected: 'fd'
    },
    {
        number: 960,
        base: 22,
        expected: '1le'
    },
    {
        number: 31,
        base: 29,
        expected: '12'
    },
    {
        number: 746,
        base: 36,
        expected: 'kq'
    },
    {
        number: 903,
        base: 36,
        expected: 'p3'
    },
    {
        number: 486,
        base: 15,
        expected: '226'
    },
    {
        number: 906,
        base: 7,
        expected: '2433'
    },
    {
        number: 992,
        base: 30,
        expected: '132'
    },
    {
        number: 588,
        base: 33,
        expected: 'hr'
    },
    {
        number: 341,
        base: 29,
        expected: 'bm'
    },
    {
        number: 760,
        base: 19,
        expected: '220'
    },
    {
        number: 878,
        base: 7,
        expected: '2363'
    },
    {
        number: 85,
        base: 7,
        expected: '151'
    },
    {
        number: 10,
        base: 5,
        expected: '20'
    },
    {
        number: 544,
        base: 36,
        expected: 'f4'
    },
    {
        number: 4,
        base: 27,
        expected: '4'
    },
    {
        number: 401,
        base: 19,
        expected: '122'
    },
    {
        number: 766,
        base: 24,
        expected: '17m'
    },
    {
        number: 622,
        base: 19,
        expected: '1de'
    },
    {
        number: 349,
        base: 32,
        expected: 'at'
    },
    {
        number: 989,
        base: 34,
        expected: 't3'
    },
    {
        number: 540,
        base: 12,
        expected: '390'
    },
    {
        number: 102,
        base: 8,
        expected: '146'
    },
    {
        number: 876,
        base: 4,
        expected: '31230'
    },
    {
        number: 677,
        base: 26,
        expected: '101'
    },
    {
        number: 705,
        base: 10,
        expected: '705'
    },
    {
        number: 773,
        base: 17,
        expected: '2b8'
    },
    {
        number: 513,
        base: 15,
        expected: '243'
    },
    {
        number: 946,
        base: 22,
        expected: '1l0'
    },
    {
        number: 991,
        base: 16,
        expected: '3df'
    },
    {
        number: 754,
        base: 32,
        expected: 'ni'
    },
    {
        number: 647,
        base: 24,
        expected: '12n'
    },
    {
        number: 757,
        base: 18,
        expected: '261'
    },
    {
        number: 27,
        base: 25,
        expected: '12'
    },
    {
        number: 106,
        base: 29,
        expected: '3j'
    },
    {
        number: 760,
        base: 33,
        expected: 'n1'
    },
    {
        number: 50,
        base: 22,
        expected: '26'
    },
    {
        number: 689,
        base: 26,
        expected: '10d'
    },
    {
        number: 996,
        base: 17,
        expected: '37a'
    },
    {
        number: 768,
        base: 36,
        expected: 'lc'
    },
    {
        number: 408,
        base: 18,
        expected: '14c'
    },
    {
        number: 744,
        base: 14,
        expected: '3b2'
    },
    {
        number: 389,
        base: 16,
        expected: '185'
    },
    {
        number: 827,
        base: 17,
        expected: '2eb'
    },
    {
        number: 968,
        base: 28,
        expected: '16g'
    },
    {
        number: 995,
        base: 23,
        expected: '1k6'
    },
    {
        number: 2,
        base: 16,
        expected: '2'
    },
    {
        number: 404,
        base: 17,
        expected: '16d'
    },
    {
        number: 651,
        base: 5,
        expected: '10101'
    },
    {
        number: 521,
        base: 14,
        expected: '293'
    },
    {
        number: 107,
        base: 10,
        expected: '107'
    },
    {
        number: 384,
        base: 3,
        expected: '112020'
    },
    {
        number: 270,
        base: 34,
        expected: '7w'
    },
    {
        number: 868,
        base: 20,
        expected: '238'
    },
    {
        number: 655,
        base: 31,
        expected: 'l4'
    },
    {
        number: 334,
        base: 9,
        expected: '411'
    },
    {
        number: 99,
        base: 10,
        expected: '99'
    },
    {
        number: 115,
        base: 18,
        expected: '67'
    },
    {
        number: 181,
        base: 27,
        expected: '6j'
    },
    {
        number: 790,
        base: 18,
        expected: '27g'
    },
    {
        number: 495,
        base: 30,
        expected: 'gf'
    },
    {
        number: 756,
        base: 20,
        expected: '1hg'
    },
    {
        number: 949,
        base: 18,
        expected: '2gd'
    },
    {
        number: 91,
        base: 18,
        expected: '51'
    },
    {
        number: 566,
        base: 25,
        expected: 'mg'
    },
    {
        number: 801,
        base: 35,
        expected: 'mv'
    },
    {
        number: 813,
        base: 11,
        expected: '67a'
    },
    {
        number: 762,
        base: 33,
        expected: 'n3'
    },
    {
        number: 43,
        base: 26,
        expected: '1h'
    },
    {
        number: 478,
        base: 24,
        expected: 'jm'
    }
]
```

[We'll discuss the results of running this in the next section](ruby-07.md)
