I highly recommend getting the rust plugin for IntelliJ, but you can use whatever editor you want.

## Creating a rust project
The main command line tool we'll use is `cargo`.
It's a set of tools for managing rust projects.
We can create a new project by running:
```bash
cargo new hello-world --bin
```
`cargo new` says you're creating a new project, `hello-world` says you're creating a project called "hello-world", and `--bin` says you want to have it create executable files.

Note that we're building a pure rust project.
The prediction server is written half in rust and half in ruby, since it's really easy to call rust functions from ruby using a library called helix.
This let's us get the best of both worlds out in production, but for now let's get back to learning rust.

## What did that just create?
First, it created a folder called hello-world.
If you look inside it, you'll see a few things:
- Cargo.toml. This is kinda like the Gemfile from ruby, with a few things added on top. It specifies the name of the project, the version, and any dependencies.
- Cargo.lock. This is exactly like the Gemfile.lock. It locks the versions of your dependencies so it doesn't change out from underneath you; you'll never edit this file directly.
- .gitignore, which says to ignore the target directory, where it outputs built files.
- The src directory, and in it main.rs

Let's open up main.rs in IntelliJ and have a look.
It should look like:
```rust
fn main() {
    println!("Hello, world!");
}
```

Wow!
It generated a hello world function for us -- it does so every time you run `cargo new`, no matter what name you give the project. 
Every time you run the program (which we'll get to momentarily) it will call `main()`.
`fn main() {` just says to create a function named main that takes no arguments and has no return value.
`println!("Hello, world!");` says to call the `println!` macro with the argument `"Hello, world!"` 

For now you can just think of a macro like a function, although there are some key differences.

## Running it
First, let's go into the `hello-world` folder we made with
```bash
cd hello-world
```

And then we can run it with
```bash
cargo run
```

It should print out something along the lines of
```text
root@2c90240a5f19 /h/hello-world# cargo run
   Compiling hello-world v0.1.0 (file:///home/hello-world)
    Finished dev [unoptimized + debuginfo] target(s) in 0.75 secs
     Running `target/debug/hello-world`
Hello, world!
```

## A small change
Let's make it print out the sum of two variables, `a` and `b`.
Set `a` to two with `let a = 2;`, and make `b` equal five.

We also need to make it print.
`println!` can take a format string, so that something like `println!("Hi {}", "Bob")` would print "Hi Bob". 
We can take advantage of this to print our result:
```rust
println!("{} + {} = {}", a, b, a + b);
```


Your code should now look like:
```rust
fn main() {

    let a = 5;
    let b = 2;

    println!("{} + {} = {}", a, b, a + b);
}
```

Try running it. 
If it prints out `5 + 2 = 7` then you can move on to [part 3](rust-03.md)