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
