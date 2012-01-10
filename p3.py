p = 600851475143
factors = []

remainder = p
f = 2
while f <= remainder:
	if remainder % f == 0:
		factors.append(f)
		remainder /= f
	f += 1

print factors
