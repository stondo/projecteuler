import itertools

def fibonacci(n):
    if n == 0:
        return 0
    elif n == 1:
        return 1
    else:
        return fibonacci(n - 2) + fibonacci(n - 1)

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
