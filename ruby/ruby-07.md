In the previous step, we added a bunch of tests, and the results... weren't great.
```text
Running 100 tests
Failed to convert 322 to base 16 (got 0142, 142 expected)
Failed to convert 187 to base 2 (got 010111011, 10111011 expected)
Failed to convert 748 to base 20 (got 01178, 1h8 expected)
Failed to convert 166 to base 22 (got 0712, 7c expected)
Failed to convert 883 to base 16 (got 0373, 373 expected)
Failed to convert 217 to base 32 (got 0625, 6p expected)
Failed to convert 447 to base 24 (got 01815, if expected)
Failed to convert 507 to base 13 (got 0300, 300 expected)
Failed to convert 800 to base 20 (got 0200, 200 expected)
Failed to convert 188 to base 20 (got 098, 98 expected)
Failed to convert 665 to base 10 (got 0665, 665 expected)
Failed to convert 861 to base 34 (got 02511, pb expected)
Failed to convert 425 to base 30 (got 0145, e5 expected)
Failed to convert 868 to base 29 (got 01027, 10r expected)
Failed to convert 930 to base 14 (got 04106, 4a6 expected)
Failed to convert 979 to base 21 (got 02413, 24d expected)
Failed to convert 806 to base 3 (got 01002212, 1002212 expected)
Failed to convert 755 to base 21 (got 011420, 1ek expected)
Failed to convert 12 to base 10 (got 012, 12 expected)
Failed to convert 586 to base 17 (got 0208, 208 expected)
Failed to convert 663 to base 36 (got 01815, if expected)
Failed to convert 964 to base 34 (got 02812, sc expected)
Failed to convert 750 to base 36 (got 02030, ku expected)
Failed to convert 731 to base 8 (got 01333, 1333 expected)
Failed to convert 874 to base 9 (got 01171, 1171 expected)
Failed to convert 613 to base 28 (got 02125, lp expected)
Failed to convert 487 to base 36 (got 01319, dj expected)
Failed to convert 998 to base 14 (got 0514, 514 expected)
Failed to convert 9 to base 12 (got 09, 9 expected)
Failed to convert 181 to base 10 (got 0181, 181 expected)
Failed to convert 523 to base 34 (got 01513, fd expected)
Failed to convert 960 to base 22 (got 012114, 1le expected)
Failed to convert 31 to base 29 (got 012, 12 expected)
Failed to convert 746 to base 36 (got 02026, kq expected)
Failed to convert 903 to base 36 (got 0253, p3 expected)
Failed to convert 486 to base 15 (got 0226, 226 expected)
Failed to convert 906 to base 7 (got 02433, 2433 expected)
Failed to convert 992 to base 30 (got 0132, 132 expected)
Failed to convert 588 to base 33 (got 01727, hr expected)
Failed to convert 341 to base 29 (got 01122, bm expected)
Failed to convert 760 to base 19 (got 0220, 220 expected)
Failed to convert 878 to base 7 (got 02363, 2363 expected)
Failed to convert 85 to base 7 (got 0151, 151 expected)
Failed to convert 10 to base 5 (got 020, 20 expected)
Failed to convert 544 to base 36 (got 0154, f4 expected)
Failed to convert 4 to base 27 (got 04, 4 expected)
Failed to convert 401 to base 19 (got 0122, 122 expected)
Failed to convert 766 to base 24 (got 01722, 17m expected)
Failed to convert 622 to base 19 (got 011314, 1de expected)
Failed to convert 349 to base 32 (got 01029, at expected)
Failed to convert 989 to base 34 (got 0293, t3 expected)
Failed to convert 540 to base 12 (got 0390, 390 expected)
Failed to convert 102 to base 8 (got 0146, 146 expected)
Failed to convert 876 to base 4 (got 031230, 31230 expected)
Failed to convert 677 to base 26 (got 0101, 101 expected)
Failed to convert 705 to base 10 (got 0705, 705 expected)
Failed to convert 773 to base 17 (got 02118, 2b8 expected)
Failed to convert 513 to base 15 (got 0243, 243 expected)
Failed to convert 946 to base 22 (got 01210, 1l0 expected)
Failed to convert 991 to base 16 (got 031315, 3df expected)
Failed to convert 754 to base 32 (got 02318, ni expected)
Failed to convert 647 to base 24 (got 01223, 12n expected)
Failed to convert 757 to base 18 (got 0261, 261 expected)
Failed to convert 27 to base 25 (got 012, 12 expected)
Failed to convert 106 to base 29 (got 0319, 3j expected)
Failed to convert 760 to base 33 (got 0231, n1 expected)
Failed to convert 50 to base 22 (got 026, 26 expected)
Failed to convert 689 to base 26 (got 01013, 10d expected)
Failed to convert 996 to base 17 (got 03710, 37a expected)
Failed to convert 768 to base 36 (got 02112, lc expected)
Failed to convert 408 to base 18 (got 01412, 14c expected)
Failed to convert 744 to base 14 (got 03112, 3b2 expected)
Failed to convert 389 to base 16 (got 0185, 185 expected)
Failed to convert 827 to base 17 (got 021411, 2eb expected)
Failed to convert 968 to base 28 (got 01616, 16g expected)
Failed to convert 995 to base 23 (got 01206, 1k6 expected)
Failed to convert 2 to base 16 (got 02, 2 expected)
Failed to convert 404 to base 17 (got 01613, 16d expected)
Failed to convert 651 to base 5 (got 010101, 10101 expected)
Failed to convert 521 to base 14 (got 0293, 293 expected)
Failed to convert 107 to base 10 (got 0107, 107 expected)
Failed to convert 384 to base 3 (got 0112020, 112020 expected)
Failed to convert 270 to base 34 (got 0732, 7w expected)
Failed to convert 868 to base 20 (got 0238, 238 expected)
Failed to convert 655 to base 31 (got 0214, l4 expected)
Failed to convert 334 to base 9 (got 0411, 411 expected)
Failed to convert 99 to base 10 (got 099, 99 expected)
Failed to convert 115 to base 18 (got 067, 67 expected)
Failed to convert 181 to base 27 (got 0619, 6j expected)
Failed to convert 790 to base 18 (got 02716, 27g expected)
Failed to convert 495 to base 30 (got 01615, gf expected)
Failed to convert 756 to base 20 (got 011716, 1hg expected)
Failed to convert 949 to base 18 (got 021613, 2gd expected)
Failed to convert 91 to base 18 (got 051, 51 expected)
Failed to convert 566 to base 25 (got 02216, mg expected)
Failed to convert 801 to base 35 (got 02231, mv expected)
Failed to convert 813 to base 11 (got 06710, 67a expected)
Failed to convert 762 to base 33 (got 0233, n3 expected)
Failed to convert 43 to base 26 (got 0117, 1h expected)
Tests complete
```

In fact, it looks like nearly all of them failed.
Looking a little closer, we can see two main types of failures:
1. Everything has an extra zero in front of it
2. When the digit is 10 or above, it does not get converted into a letter (in base 16 say, 10 is represented as `a`). 

## Converting the letters
We already have an array called converted that we want to `map` into something else.
We could just say `converted = converted.map do # ...`, but arrays actually have a function defined on them that do exactly that: the in place map, or:
```ruby
converted.map! do |digit|
  # digit will take on the value of each element in the array
  # the value last line of this block will be the new value of that position in the array 
end
```

When the digit is under 10, we can just leave it as is.
Otherwise, we need to convert it into a letter: 10 is 'a', 11 is 'b', all the way up to 35 being 'z' (anything above base 36 won't be supported, but that's okay. We can always add an error check to our convert function like we had before).
The simplest way to do this is get an array that looks like `['a', 'b', ... 'z']` and look at the index `digit - 10`.
Thankfully, ruby is incredible.
```ruby
('a'..'z').to_a[digit - 10]
```
`'a'..'z'` creates a range object, which `.to_a` converts into an array that we index into.
All that's left is to wrap this in an if block:
```ruby
converted.map! do |digit|
  if digit >= 10
    digit = ('a'..'z').to_a[digit - 10]
  end

  digit
end
```

With a one liner if statement like this, we can actually put it on the same line.
```ruby
converted.map! do |digit|
  digit = ('a'..'z').to_a[digit - 10] if digit >= 10

  digit
end
```
Sometimes this helps make the code more readable, and sometimes it doesn't.
It's a style choice, but one that you should know ruby supports.

If we run the tests again, they'll all still fail because of the zeroes, but they're a lot closer.

## The extra zeros
One fun thing to do when you have good test coverage is just start messing around by trial and error.
If you're right, then the tests will all pass.
Otherwise, you'll know to try something else. 
Let's try just making it consider one fewer decimal place.
```ruby
max_decimal_place = (Math.log(number) / Math.log(base)).ceil - 1
``` 

```text
Running 100 tests
Failed to convert 4 to base 2 (got 20, 100 expected)
Tests complete
```

That's interesting.
It fixed the vast majority of cases, but caused a new one to fail.
Looks like there's something a little more insidious going on.
I'll give you a hint -- it does have to do with how the number of decimal places is calculated -- but I highly recommend you try to fix it yourself.

If you give up or if you've found it, I'll see you in the [next section](ruby-08.md)
