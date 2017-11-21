Let's say we're making a banking system, and there are two bank accounts, once for Alice, and another for Bob.

At the beginning, the account values are:
```text
Alice: $100
Bob: $70
```

Now, we need to have two transactions happen in different threads: Bob gives Alice $30, and Bob deposits $40 in his account. 

## No locks
One could imagine an implementation in which the following happens in one thread:
```text
READ Bob's account: $70
READ Alice's account: $100
SET Alice's account to $100 + $30 = $130
SET Bob's account to $70 - $30 = $40
```

And in another thread:
```text
READ Bob's account: $70
SET Bob's account to $70 + $40 = $110
```

This will cause problems if the two threads are running simultaneously, because depending on which one finishes first, the final value of Bob's account will be either $40 or $110, neither of which is the correct $80.
Let's use locks.

## Locks
```text
LOCK Bob's account (so only this thread can change it)
READ Bob's account: $70
LOCK Alice's account
READ Alice's account: $100
SET Alice's account to $100 + $30 = $130
UNLOCK Alice's account
SET Bob's account to $70 - $30 = $40
UNLOCK Bob's account (so other threads can change it again)
```

And in another thread:
```text
LOCK Bob's account, which will wait until it's unlocked
READ Bob's account: $40
SET Bob's account to $40 + $40 = $80
UNLOCK Bob's account
```

And everything works!

## To rust
Declaring a variable as mutable effectively establishes a lock on it.
The compiler will enforce that two threads cannot change a mutable variable at the same time; something can't be in two places at once.

But what about when we do want to have something in multiple places at once?
Eg, three threads all running:
```text
READ Alice's account: $100
```
In this case, there's no conflict, so we don't need to lock the value.
This is what immutable variables do.
They can safely be passed around and read by multiple threads at the same time, because the value won't change.

## Wait a second, we weren't multi-threading in the main tutorial, but the compiler still yelled at us
Good point.
The code:
```rust
let result = a + b;
result *= 2;
```
happens in the same thread, so why do we need to say whether or not it's mutable?
This comes down to how the language is designed.
While this particular scenario is okay, you can imagine it doing some monkey business with result somewhere else down the line, so the only way for the compiler to enforce this everywhere it to be really strict.

Anyway, you should get back to reading [part 3](rust-03.md).

