fn fibonacci(n: u128) -> u128 {
    if n == 0 { 0 }
    else if n == 1 { 1 }
    else { fibonacci(n - 2) + fibonacci(n - 1) }
}

pub fn sum_even_valued_fibo_below(below: u128) -> u128 {
    return (1u128..)
      .map(|n| fibonacci(n))
      .filter(|n| n % 2 == 0 && *n != 0u128)
      .take_while(|n| *n < below)
      .fold(0, |acc, i| acc + i); 
     
}

#[cfg(test)]
mod tests {
    // Note this useful idiom: importing names from outer (for mod tests) scope.
    use super::*;

    #[test]
    fn test_fibonacci_6() {
        assert_eq!(fibonacci(6), 8);
    }

    #[test]
    fn test_sum_even_valued_fibo_below_below_4000000() {
        assert_eq!(sum_even_valued_fibo_below(4000000), 4613732);
    }
}