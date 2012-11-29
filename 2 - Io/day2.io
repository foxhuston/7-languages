# pretty stock recursive fibOB
fib := method(n, if(n < 3, 1, fib(n-1) + fib(n-2)))

# loop fib
fib := method(n,
    i := 0
    a := 1
    b := 1
    for(i, 1, n, 
    	   t := b
    	   b := b + a
	   a := t
    )
    a)

# Redefining n / 0

Number / := method(n, if(n == 0, 0, self / n))

# problem: this is infinitely recursive. I'd like to know how to get at what / used to be.
#
# This is as far as I got :/
