# Python: Largest prime factor

# Problem 3
# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?
from math import sqrt


def primeFactors(n, acc=None):
    if acc == None:
        acc = []

    if n % 2 == 0:
        acc.append(2)
        return primeFactors(n/2, acc)

    for i in range(3, int(sqrt(n) + 1)):
        if n % i == 0:
            acc.append(i)
            return primeFactors(n/i, acc)

    acc.append(int(n))
    return acc


def largestPrimeFactor(n):
    return max(primeFactors(n))
