
There are a couple more bits of rust syntax we should learn before we get to the real project this tutorial is built around: machine learning using gradient descent. 
First up:

## Mutability

Let's store our result in a variable, called result:
```rust
let result = a + b;
``` 

Let's also multiply it by two, and have it print the result, so our final code looks something like:
```rust
fn main() {

    let a = 5;
    let b = 2;

    let result = a + b;
    result *= 2;

    println!("Result is: {}", result);
}
```

Now let's run it (with `cargo run`)...

Uh oh!
It probably printed out something like:
```text
root@2c90240a5f19 /h/hello-world# cargo run
   Compiling hello-world v0.1.0 (file:///home/hello-world)
error[E0384]: re-assignment of immutable variable `result`
 --> src/main.rs:7:5
  |
6 |     let result = a + b;
  |         ------ first assignment to `result`
7 |     result *= 2;
  |     ^^^^^^^^^^^ re-assignment of immutable variable

error: aborting due to previous error

error: Could not compile `hello-world`.

To learn more, run the command again with --verbose.
```

In rust, there are two kinds of variable: mutable ones and immutable ones.
By default, variables are immutable (think read-only): this means you can't change them once they're assigned.
So if you say `let result = a + b;`, we can't change what result is later on.
Mutable variables, on the other hand, can change.
Let's make it mutable by changing `let result = a + b;` to
```rust
let mut result = a + b;
```

Try re-running it; it should print out `Result is: 14`.

You might wonder why they would design it like this, or why every variable isn't mutable by default.
The main reason is thread-safety. 
If you know anything about databases, an mutable variable is like an exclusive lock.
If your variable is mutable, that means you can only change it in one place at a time, which the compiler enforces.
That prevents errors where, if you're trying to change the value of a variable in two different threads at once, one thread overwrites another.
Immutable variables are good for when you want to be reading it in multiple places at once, which is safe.
If you're still curious, [here's an optional example that goes into a little more depth](mutability-example.md)

In general, don't make variables mutable unless you need to. 

## Type annotation
We haven't yet talked about types, even though rust is a compiled language.
That's because the rust compiler is super smart, and can infer the type of variables most of the time.
Sometimes though, you need to give the type of a variable explicitly.
Here are a couple examples of how to do that:

```rust
let a : i32 = 5; // a is a 32 bit integer
let b : i64 = 5; // b is a 64 bit integer
let c : f32 = 3.14; // c is a 32 bit float
let d : &str = "hi"; // d is a reference to a str (there are way too many string types in Rust, which we'll get into eventually)
```

Anyway, on to [Part 4!](rust-04.md)