
Just doing quadratic equations is pretty boring.
Let's make it so that we can pass in any kind of equation, with any number of variables.

## Traits
Traits are a generalized way of categorizing structs.
We'll make a Trait called Equation, tell it that QuadraticEquation is a kind of Equation, and make gradient descent accept any Equation.

The syntax to start is:
```rust
trait Equation {
    fn evaluate(&self, x : f32) -> f32;

    fn derivative_at(&self, x : f32) -> f32;
}
```
This just says all equations need to implement those two function signatures.
We can now change `impl QuadraticEquation` to
```rust
impl Equation for QuadraticEquation
```
We already have the required functions implemented, so we're good to go.

Finally, we need to change `fn gradient_descent(equation : &QuadraticEquation) -> f32` to
```rust
fn gradient_descent(equation : &Equation) -> f32
```

Run it to verify that everything works.

## Making equation accept multiple variables
Let's change the function signature to accept a vector (well, a reference to a vector to avoid copies).
Let's also give it an `arity` function, so that we know how many inputs it operates on:

```rust
trait Equation {
    fn evaluate(&self, x : &Vec<f32>) -> f32;

    fn gradient_at(&self, x : &Vec<f32>) -> Vec<f32>;

    fn get_arity(&self) -> usize;
}
```

We also have to convert our implementation over to match that function signature:
```rust
impl Equation for QuadraticEquation {

    fn evaluate(&self, x : &Vec<f32>) -> f32 {
        return self.a*x[0]*x[0] + self.b*x[0] + self.c;
    }

    fn gradient_at(&self, x : &Vec<f32>) -> Vec<f32> {
        return vec![2.0*self.a*x[0] + self.b];
    }

    fn get_arity(&self) -> usize {
        return 1;
    }
}
```
There are a couple things to point out here:
- We converted lots of `f32`s to `Vec<f32>`, or vectors of floats
- Instead of `x`, we have `x[0]`, to represent the first element of the vector
- In the gradient function, we return a vector, which we product with the `vec![]` macro, which is a nice shorthand.

## Make main test it properly
Our main function still thinks it's operating in float land, not vector land.
Let's make it look like:
```rust
// assert its local minimum is really close to -0.25
let min = &gradient_descent(equation);
assert!((min[0] - (-0.25)).abs() < 0.01);
println!("Success! Local minimum of {} is at {:?}", equation.evaluate(min), min)
```
There are again a few things to note:
- We take the reference of the output of gradient descent so that we don't have to copy it places
- We say `min[0]` instead of just `min`
- We use the `{:?}` formatting string, which knows how to print out vectors

## Making gradient descent work
There are lots of things to change in gradient descent.
First, we need to make it return a vector:
```rust
fn gradient_descent(equation : &Equation) -> Vec<f32>
```

We also need to initialize x to a vector of zeroes, rather than just zero:
```rust
// initialize x to all zeros
let mut x : Vec<f32> = Vec::with_capacity(equation.get_arity());
for _ in 0..equation.get_arity() {
    x.push(0.0);
}
```

Inside the loop, we need to build up the `new_x` for each component of the gradient.
```rust
let mut new_x = Vec::with_capacity(equation.get_arity());
let mut total_error = 0.0;

for i in 0..equation.get_arity() {
    let delta : f32 = step_size*gradient[i];
    total_error += delta.abs();
    new_x.push(x[i] - delta);
}
```

Our full gradient descent function should now look like:
```rust
fn gradient_descent(equation : &Equation) -> Vec<f32> {
    // how quickly it moves. If this is too high, it will overshoot; too low, and it will be slow
    let step_size = 0.1;

    // don't run this function forever
    let max_iterations = 1_000;

    let max_error = 0.00001;

    // initialize x to all zeros
    let mut x : Vec<f32> = Vec::with_capacity(equation.get_arity());
    for _ in 0..equation.get_arity() {
        x.push(0.0);
    }

    for iteration in 0..max_iterations {
        let gradient = equation.gradient_at(&x);
        let mut new_x = Vec::with_capacity(equation.get_arity());
        let mut total_error = 0.0;

        for i in 0..equation.get_arity() {
            let delta : f32 = step_size*gradient[i];
            total_error += delta.abs();
            new_x.push(x[i] - delta);
        }

        // check for convergence
        if total_error < max_error {
            println!("Converged on iteration {}", iteration);
            return new_x;
        }

        x = new_x;
    }

    return x;
}
```

If you run it, you should get:
```text
Converged on iteration 19
Success! Local minimum of 2.875 is at [-0.24999087]
```

## Multi-dimensional test
Let's make sure it really works in multiple dimensions.
Here's the code for a HyperbolicParabaloid:
```rust
/*
 * Represents the equation z = ax^2 + bx + cy^2 + dy + e
 */
struct HyperbolicParabaloid {
    a: f32,
    b: f32,
    c: f32,
    d: f32,
    e: f32
}

impl Equation for HyperbolicParabaloid {

    fn evaluate(&self, x : &Vec<f32>) -> f32 {
        return self.a*x[0]*x[0] + self.b*x[0] + self.c*x[1]*x[1] + self.d*x[1] + self.e;
    }

    fn gradient_at(&self, x : &Vec<f32>) -> Vec<f32> {
        return vec![
            2.0*self.a*x[0] + self.b,
            2.0*self.c*x[1] + self.d
        ];
    }

    fn get_arity(&self) -> usize {
        return 2;
    }
}
```

And the code to test it:
```rust
fn main() {
    // create an equation representing 2x^2 + x + 3
    let equation = &HyperbolicParabaloid {
        a: 2.0,
        b: 1.0,
        c: 2.0,
        d: -8.0,
        e: 9.0
    };

    // assert its local minimum is really close to -0.25
    let min = &gradient_descent(equation);
    assert!((min[0] - (-0.25)).abs() < 0.01);
    assert!((min[1] - (2.0)).abs() < 0.01);
    println!("Success! Local minimum of {} is at {:?}", equation.evaluate(min), min)
}
```

If you run this, you should get:
```text
Converged on iteration 23
Success! Local minimum of 0.875 is at [-0.24999881, 1.9999905]
```

This section was way too long.
On to the [next one](rust-07.md)