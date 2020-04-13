use structopt::StructOpt;

mod solution;
use solution::sum_even_valued_fibo_below;


#[derive(StructOpt)]
struct Cli {
    below: u128
}

fn main() {
    let args = Cli::from_args();
    let ans = sum_even_valued_fibo_below(args.below);
    println!("TThe sum of the even-valued terms of the Fibonacci sequence below {0} is: {1}", args.below, ans);
}
