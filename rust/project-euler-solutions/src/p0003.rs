use crate::common::prime_factors;
use crate::common::prime_factors_recursive;

// Rust: Largest prime factor
// Problem 3
// The prime factors of 13195 are 5, 7, 13 and 29.

// What is the largest prime factor of the number 600851475143 ?

pub fn largest_prime_factor_recursive(n: u128) -> u128 {
    let prime_factors = prime_factors_recursive(n, &vec![]);
    let mut curr_max = prime_factors[0];

    for i in prime_factors {
        if i > curr_max {
            curr_max = i;
        }
    }

    return curr_max;
}

pub fn largest_prime_factor(n: u128) -> u128 {
    let prime_factors = prime_factors(n);
    let mut curr_max = prime_factors[0];
    for i in prime_factors {
        if i > curr_max {
            curr_max = i;
        }
    }

    return curr_max;
}

#[cfg(test)]
mod tests {
    // Note this useful idiom: importing names from outer (for mod tests) scope.
    use super::*;

    #[test]
    fn test_largest_prime_factor_recursive() {
        assert_eq!(largest_prime_factor_recursive(600851475143), 6857);
    }

    #[test]
    fn test_largest_prime_factor() {
        assert_eq!(largest_prime_factor(600851475143), 6857);
    }
}
