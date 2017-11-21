
## Convergence
Chances are, we don't need to wait 1000 iterations on a quadratic function, and we might need to run more iterations on different functions.
It's still worth having a maximum number to run, but we should also check when it converges.
We'll define convergence to mean "not changing very much".

First, make a variable that tracks the most it can change without declaring it as "converged".
```rust
let max_error = 0.00001;
```

Then, let's check for convergence in the body of the loop:
```rust
// check for convergence
if (x - new_x).abs() < max_error {
    println!("Converged on iteration {}", iteration);
    return new_x;
}

x = new_x;
```

If you run it now, it should say
```text
Converged on iteration 19
Success! Local minimum of 2.875 is at -0.24999087
```

Wow!
It returned 50 times faster, still giving a great result.
That saved us a lot!

Your new gradient descent function should look like:
```rust
fn gradient_descent(equation : &QuadraticEquation) -> f32 {
    // how quickly it moves. If this is too high, it will overshoot; too low, and it will be slow
    let step_size = 0.1;

    // don't run this function forever
    let max_iterations = 1_000;

    let max_error = 0.00001;

    let mut x : f32 = 0.0;

    for iteration in 0..max_iterations {
        let gradient = equation.derivative_at(x);
        let new_x = x - step_size * gradient;

        // check for convergence
        if (x - new_x).abs() < max_error {
            println!("Converged on iteration {}", iteration);
            return new_x;
        }

        x = new_x;
    }

    return x;
}
```

On to [Part 6](rust-06.md)