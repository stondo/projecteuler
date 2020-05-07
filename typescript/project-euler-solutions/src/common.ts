export class Common {
  public static isMultipleOf(n: number, m: number): boolean {
    return n % m === 0;
  }

  public static fibonacci(n: number): number {
    if (n === 0) return 0;
    else if (n === 1) return 1;
    else return this.fibonacci(n - 2) + this.fibonacci(n - 1);
  }

  public static primeFactors(n: number, acc: number[] = []): number[] {
    if (n % 2 === 0) {
      acc.push(2);
      return this.primeFactors(n / 2, acc);
    } else {
      for (let i = 3; i < Math.floor(Math.sqrt(n) + 1); i = i + 2) {
        if (n % i === 0) {
          acc.push(i);
          return this.primeFactors(n / i, acc);
        }
      }

      acc.push(n);
      return acc;
    }
  }
}
