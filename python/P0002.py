# Python: Even Fibonacci numbers

# Problem 2
# Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:

# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

# By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.


from common_funcs import fibonacci
import itertools


def fib_even_gen():
    count = 0
    while True:
        fib = fibonacci(count)
        if fib % 2 == 0:
            yield fib
        count += 1


def sumEvenFibonacciUntil(below):
    even_fib = fib_even_gen()
    return sum([f for f in itertools.takewhile(lambda n: n < below, even_fib)])