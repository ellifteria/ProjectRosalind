import std/strutils

proc fib(n: int): int = 
    if n <= 1:
        return n

    return fib(n - 1) + fib(n - 2)

let n: int = parseInt(readLine(stdin))
echo "Analyzing:"
echo "n = ", n, "\n"
echo "Result:"
echo fib(n)
