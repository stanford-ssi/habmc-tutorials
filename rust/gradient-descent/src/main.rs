use std::io::{BufReader,BufRead};
use std::fs::File;

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

struct Datapoint {
    data : Vec<f32>,
    result : f32
}

fn read_dataset(filename : &str) -> Vec<Datapoint> {
    let mut datapoints : Vec<Datapoint> = vec![];

    let file = File::open(filename).unwrap();
    for line in BufReader::new(file).lines() {
        let unwrapped_line = match line {
            Ok(line) => line,
            Err(_) => {
                continue
            }
        };

        let parts = unwrapped_line.split(": ").collect::<Vec<&str>>();

        if parts.len() != 2 {
            continue;
        }

        let data_part = parts[0].split(" ").collect::<Vec<&str>>();

        let mut data : Vec<f32> = vec![];
        for i in 0..data_part.len() {
            data.push(data_part[i].parse().unwrap());
        }

        let result_part = parts[1];

        let result : f32 = match result_part.parse() {
            Ok(number) => number,
            Err(_) => {
                continue
            }
        };

        datapoints.push(Datapoint {
            data, result
        })
    }

    return datapoints;
}

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
