use std::io::{BufReader,BufRead};
use std::fs::File;

/*
 * Represents the equation y = ax^2 + bx + c
 */
struct QuadraticEquation {
    a: f32,
    b: f32,
    c: f32
}

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


trait Equation {
    fn evaluate(&self, x : &Vec<f32>) -> f32;

    fn gradient_at(&self, x : &Vec<f32>) -> Vec<f32>;

    fn get_arity(&self) -> usize;
}

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
    println!("{:?}: {}", train[0].data, train[0].result)
}
