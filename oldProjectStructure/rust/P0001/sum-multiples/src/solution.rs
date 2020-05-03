pub fn sum_all_multiples_of_below(a: u128, b: u128, below: u128) -> u128 {
    return (1..below)
      .filter(|n| n % a == 0 || n % b ==0)
      .fold(0, |acc, i| acc + i); 
}

#[cfg(test)]
mod tests {
    // Note this useful idiom: importing names from outer (for mod tests) scope.
    use super::*;

    #[test]
    fn test_sum_all_multiples_of_3_and_5_below_10() {
        assert_eq!(sum_all_multiples_of_below(3, 5, 10), 23);
    }

    #[test]
    fn test_sum_all_multiples_of_3_and_5_below_1000() {
        assert_eq!(sum_all_multiples_of_below(3, 5, 1000), 233168);
    }
}