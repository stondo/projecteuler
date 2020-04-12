use structopt::StructOpt;

mod solution;
use solution::sum_all_multiples_of_below;

/// Search for a pattern in a file and display the lines that contain it.
#[derive(StructOpt)]
struct Cli {
    a: u128,
    b: u128,
    below: u128
}

fn main() {
    let args = Cli::from_args();
    let ans = sum_all_multiples_of_below(args.a, args.b, args.below);
    println!("The sum of the multiples of {0} and {1} below {2} is: {3}", args.a, args.b, args.below, ans);
}
