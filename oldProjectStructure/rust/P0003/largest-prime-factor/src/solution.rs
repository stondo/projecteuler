fn prime_factors_recursive(n: u128, acc: &[u128]) -> Vec<u128> {
    let mut acc = acc.to_vec();

    if n % 2 == 0 {
        acc.push(2u128);
        return prime_factors_recursive(n/2, &acc.to_owned());
    } else {
        for i in (3..((n as f64).sqrt() +1.0f64) as u128).step_by(2) {
            if n % i == 0 {
                acc.push(i);
                return prime_factors_recursive(n/i, &acc.to_owned());
            }
        }
    }

    acc.push(n);
    return acc.to_owned();
}

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


fn prime_factors(n: u128) -> Vec<u128> {
    let mut n = n;
    let mut acc = vec![];

    while n % 2 == 0 {
        acc.push(2u128);
        n = n / 2;
    }

    for i in (3..((n as f64).sqrt() +1.0f64) as u128).step_by(2) {
        while n % i == 0 {
            acc.push(i);
            n = n / i;
        }
    }

    if n > 2 {
        acc.push(n);
    }

    return acc;
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
    fn test_prime_factors_recursive() {
        let acc = vec![];
        let expected = vec![5u128,7u128,13u128,29u128];
        assert_eq!(prime_factors_recursive(13195, &acc), expected);
    }

    #[test]
    fn test_largest_prime_factor_recursive() {
        assert_eq!(largest_prime_factor_recursive(600851475143), 6857);
    }

    #[test]
    fn test_prime_factors() {
        let expected = vec![5u128,7u128,13u128,29u128];
        assert_eq!(prime_factors(13195), expected);
    }

    #[test]
    fn test_largest_prime_factor() {
        assert_eq!(largest_prime_factor(600851475143), 6857);
    }
}