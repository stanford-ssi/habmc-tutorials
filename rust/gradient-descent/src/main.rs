
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
