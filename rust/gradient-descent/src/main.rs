
/*
 * Represents the equation y = ax^2 + bx + c
 */
struct QuadraticEquation {
    a: f32,
    b: f32,
    c: f32
}

impl QuadraticEquation {

    fn evaluate(&self, x : f32) -> f32 {
        return self.a*x*x + self.b*x + self.c;
    }

    fn derivative_at(&self, x : f32) -> f32 {
        return 2.0*self.a*x + self.b;
    }

}

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
