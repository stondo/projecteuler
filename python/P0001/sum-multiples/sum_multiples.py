def sumAllMultiplesOfBelow(a, b, below):
    return sum([n for n in range(1,below) if n % a == 0 or n % b ==0])