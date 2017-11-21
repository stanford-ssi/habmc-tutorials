
We're going to get rid of all that equation stuff.
While it demonstrates gradient descent nicely, putting training data into equation for it too much of a bother.
Instead, we'll calculate the gradient directly from the training data.

We want it to learn a weight vector.
If the dot product of the weight vector and the data is positive, it will classify it as `1`; if it's negative, it will classify it as `-1`.

The equation we'll be using is hinge loss.
For a given piece of training data, if the dot product is over one or less than negative one, it says the gradient is zero, since it's already really confident.
If not, it models it as the linear distance between what it says it will be and what it actually is.

Let's implement this.
First, let's initialize all the values.

```rust
fn gradient_descent(training_data : &Vec<Datapoint>) -> Vec<f32> {
    // how quickly it moves. If this is too high, it will overshoot; too low, and it will be slow
    let step_size = 0.1;

    // don't run this function forever
    let max_iterations = 1_000;

    let max_error = 0.1;

    // initialize weights to all zeros
    let arity = training_data[0].data.len();
    let mut weights : Vec<f32> = Vec::with_capacity(arity);
    for _ in 0..arity {
        weights.push(0.0);
    }

    return weights;
}
```

Then, let's loop through all the training data, check for convergence
```rust
fn gradient_descent(training_data : &Vec<Datapoint>) -> Vec<f32> {
    // how quickly it moves. If this is too high, it will overshoot; too low, and it will be slow
    let step_size = 0.1;

    // don't run this function forever
    let max_iterations = 1_000;

    let max_error = 0.1;

    // initialize weights to all zeros
    let arity = training_data[0].data.len();
    let mut weights : Vec<f32> = Vec::with_capacity(arity);
    for _ in 0..arity {
        weights.push(0.0);
    }

    for iteration in 0..max_iterations {

        let mut total_error = 0.0;

        for example in training_data {
            // TODO: calculate gradients and do gradient descent
        }

        // check for convergence
        if total_error < max_error {
            println!("Converged after {} iterations", iteration);
            break;
        }
    }

    return weights;
}
```

And finally, let's calculate the gradient using the math we described earlier, and use that to do gradient descent.
```rust
fn gradient_descent(training_data : &Vec<Datapoint>) -> Vec<f32> {
    // how quickly it moves. If this is too high, it will overshoot; too low, and it will be slow
    let step_size = 0.1;

    // don't run this function forever
    let max_iterations = 1_000;

    let max_error = 0.1;

    // initialize weights to all zeros
    let arity = training_data[0].data.len();
    let mut weights : Vec<f32> = Vec::with_capacity(arity);
    for _ in 0..arity {
        weights.push(0.0);
    }

    for iteration in 0..max_iterations {

        let mut total_error = 0.0;

        for example in training_data {

            // let's model error using hinge loss, so derivative is
            // - y * x[i] when on hinge
            // 0 otherwise

            let mut dot_product = 0.0;
            for i in 0..weights.len() {
                dot_product += weights[i] * example.data[i];
            }

            let mut gradient : Vec<f32> = vec![];
            for i in 0..arity {
                if dot_product.abs() < 1.0 {
                    gradient.push(
                        -example.result * example.data[i]
                    )
                } else {
                    gradient.push(0.0)
                }
            }

            for i in 0..arity {
                total_error += (step_size * gradient[i]).abs();
                weights[i] -= step_size * gradient[i];
            }
        }

        // check for convergence
        if total_error < max_error {
            println!("Converged after {} iterations", iteration);
            break;
        }
    }

    return weights;
}
```

## Testing
This is all well and good, but does it work?
In the main function, let's loop through the test data set and see which ones are correct.
Try writing this function yourself.

.

.

.

.

.

.

.

.

.

.

.

.

.

You should have produced something along the lines of:
```rust
fn main() {
    let train = read_dataset("./vote-train.txt");
    let weights = gradient_descent(&train);

    let test = read_dataset("./vote-test.txt");
    let mut number_accurate = 0;

    for example in &test {
        let mut dot_product = 0.0;
        for i in 0..weights.len() {
            dot_product += weights[i] * example.data[i];
        }

        if (dot_product >= 0.0 && example.result >= 0.0) ||
            (dot_product <= 0.0 && example.result <= 0.0) {
            number_accurate += 1;
        } else {
            println!("Example was wrong (got {}, should be {})", dot_product, example.result);
        }
    }

    println!("{}% accurate", 100.0*(number_accurate as f32)/(test.len() as f32));
    println!("Best weights: {:?}", weights);
}
```

When I run it, I get the following output:
```text
Converged after 54 iterations
Example was wrong (got 5.9999976, should be -1)
Example was wrong (got -5.899998, should be 1)
Example was wrong (got -6.099998, should be 1)
Example was wrong (got -5.4999976, should be 1)
97.03704% accurate
Best weights: [0.29999998, 0.20000002, -0.6, 0.19999999, 0.6, -0.9000001, 1.4000002, -0.59999996, -0.9000001, 4.1999984, -4.799998, 0.5, 0.5, -0.5, -0.1, 0.09999999, 0.09999999, -0.3, -0.20000002, 0.6, -0.5, 0.10000002, 0.6, -0.8000001, -0.19999999, 0.1, 0, 0.70000005, -0.4, -0.4, -1.8000003, 0.70000005, 1.0000001, 1.4000002, -0.5, -1.0000001, 0.4, -0.000000014901161, -0.5, 0.000000014901161, 0.09999999, -0.2, -0.3, 0.5, -0.3, -0.5, -1.3000001, 1.7000003]
```

97% accurate in 54 iterations.
Not bad.

On to [Part 9](rust-09.md), which is just tying up a few loose ends.
