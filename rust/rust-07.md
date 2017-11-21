
Our code is pretty darn good, but it's not machine learning because, well... there isn't any learning.
Let's have it train on some data.

Download both [vote-test.txt](gradient-descent/vote-test.txt) and [vote-train.txt](gradient-descent/vote-train.txt) to your gradient-descent directory.
This is data on how senators voted on certain issues, and whether they're a democrat or a republican.

Now, let's make a datapoint structure to hold the data, a function to read it, and have an empty function read the training data.
```rust
struct Datapoint {
    data : Vec<f32>,
    result : f32
}

fn read_dataset(filename : &str) -> Vec<Datapoint> {
    let mut result : Vec<Datapoint> = vec![];

    return result;
}

fn main() {
    let train = read_dataset("./vote-train.txt");
    println!("{:?}: {}", train[0].data, train[0].result)
}
```

## IO
In order to implement the `read_dataset` function, we need to have it read the files line by line and process them.
At the top of the file, we import the libraries:
```rust
use std::io::{BufReader,BufRead};
use std::fs::File;
```

Then, in our function, we open the file and read it line by line.
```rust
fn read_dataset(filename : &str) -> Vec<Datapoint> {
    let mut datapoints : Vec<Datapoint> = vec![];

    let file = File::open(filename).unwrap();
    for line in BufReader::new(file).lines() {
        
    }

    return datapoints;
}
```

Rust doesn't have errors, so `.unwrap()` will panic if it can't find the file.
That's okay in this case, but always be conscious of the unwrap function, as it could exit your code.

The line also needs to be unwrapped (to encode it as a string), but we don't want it to panic.
We do this using a match statement.
If it's some kind of error, we just skip it and move to the next line.

```rust
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

        println!("{}", unwrapped_line)
    }

    return datapoints;
}
```

## String processing
We now have to process the line into a datapoint.
We first split it into two parts:
```rust
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

        let data_part = parts[0];
        let result_part = parts[1];

        println!("{}: {}", data_part, result_part)
    }

    return datapoints;
}
```

We also need to parse the result into a float, split the data part by spaces, and parse each of those to floats.
After that's done, we'll add it to the `datapoints` vector.
The code for that looks like:

```rust
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
```

If you run the code now, it should output
```text
[1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0]: 0
```

Before moving on to the part, make sure you understand what's going on in this function.
There's a lot of rust syntax in this function, and I glossed over a lot of it.
If there's any part of it that you find confusing, ask me on slack.

Anyway, on to [Part 8](rust-08.md)
