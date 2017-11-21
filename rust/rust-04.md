Let's build a program that can do gradient descent.
Gradient descent is a machine learning technique, used to adjust what factors are important.

Start by going back to the home directory:
```bash
cd /home
```

And create a new project
```bash
cargo new gradient-descent --bin
```

## The core algorithm
Gradient descent seeks to minimize a function by going in the direction of the derivative.
Let's start by taking the equation: `x^2`.
Say we're at position `x = 1`, and our step size is `0.1`.
The derivative is `2`, so we say our new position is current position _minus_ derivative times step size, or `0.8`.
On the next iteration, the derivative is `1.6`, so our new position would be `0.64`. 
We'd keep on doing this process until we reached the local minimum, zero.

## Quadratic equation class
We're going to start with a really simple version of gradient descent, then slowly make it more complex.
At the top of our `main.rs` (in the gradient-descent folder), make a new Struct called QuadraticEquation.
It should have three variables, a, b, and c, all of which are floats.
The code to do this is:
```rust
/*
 * Represents the equation y = ax^2 + bx + c
 */
struct QuadraticEquation {
    a: f32,
    b: f32,
    c: f32 
}
```

It also needs two functions: evaluate and derivative_at.
We can write this as follows:
```rust
impl QuadraticEquation {

    fn evaluate(&self, x : f32) -> f32 {
        return self.a*x*x + self.b*x + self.c;
    }

    fn derivative_at(&self, x : f32) -> f32 {
        return 2.0*self.a*x + self.b;
    }

}
```

- `impl QuadraticEquation` says that you're defining methods for the QuadraticEquation struct.
- `&self` says that you are taking an immutable reference to yourself as an argument
- `x : f32` says that you're taking a 32 bit float named x as an argument
- `-> f32` says you're returning a 32 bit float

## A simple test
We want to know when it's working.
Let's create a gradient descent function that just returns zero.
```rust
fn gradient_descent(equation : &QuadraticEquation) -> f32 {
    return 0.0;
}
```
Note that rather than taking in just a QuadraticEquation, it's taking in a reference to a QuadraticEquation.
This is more efficient as it doesn't have to copy the data from one part of memory to another.

And make our main function call it.
```rust
fn main() {
    // create an equation representing 2x^2 + x + 3
    let equation = &QuadraticEquation {
        a: 2.0,
        b: 1.0,
        c: 3.0
    };

    // assert its local minimum is really close to -0.25
    let min = gradient_descent(equation);
    assert!((min - (-0.25)).abs() < 0.01);
    println!("Success! Local minimum of {} is at {}", equation.evaluate(min), min)
}
```

If you run it (with `cargo run`), it will tell you:
```text
thread 'main' panicked at 'assertion failed: (gradient_descent(equation) - (-0.25)).abs() < 0.01', src/main.rs:46:4
```

## The gradient descent function
Let's make it work!
First, define a few constants:
```rust
// how quickly it moves. If this is too high, it will overshoot; too low, and it will be slow
let step_size = 0.1;

// don't run this function forever
let max_iterations = 1_000;
```

And a variable to hold our current x.
```rust
let mut x : f32 = 0.0;
```

Then let's make it repeatedly refine the estimate of x:
```rust
for iteration in 0..max_iterations {
    let gradient = equation.derivative_at(x);
    x -= step_size * gradient;
}
```

And finally return, so that our function looks like:
```rust
fn gradient_descent(equation : &QuadraticEquation) -> f32 {
    // how quickly it moves. If this is too high, it will overshoot; too low, and it will be slow
    let step_size = 0.1;

    // don't run this function forever
    let max_iterations = 1_000;

    let mut x : f32 = 0.0;

    for iteration in 0..max_iterations {
        let gradient = equation.derivative_at(x);
        x -= step_size * gradient;
    }

    return x;
}
```

If you run it now, we should get it telling us:
```text
Success! Local minimum of 2.875 is at -0.24999999
```

On to [Part 5](rust-05.md)
