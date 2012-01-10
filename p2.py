fib = [1,2]
last_fib = 3
while last_fib < 4000000:
	last_fib = fib[-1]+fib[-2]
	fib.append(last_fib)
sum = 0
for f in fib:
	if f % 2 == 0: sum += f

print sum
