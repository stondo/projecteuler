use structopt::StructOpt;
mod solution;
use crate::solution::{largest_prime_factor, largest_prime_factor_recursive};

#[derive(StructOpt)]
struct Cli {
    n: u128
}

fn main() {
    let args = Cli::from_args();
    let ans = largest_prime_factor(args.n);
    println!("The largest prime factor of {0} is: {1} - (not recursive fn)", args.n, ans,);

    let ans = largest_prime_factor_recursive(args.n);
    println!("The largest prime factor of {0} is: {1} - (recursive fn)", args.n, ans);
}
