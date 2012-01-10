mults = []

next_mult = 3
while next_mult < 1000:
	mults.append(next_mult)
	next_mult += 3
	
next_mult = 5
while next_mult < 1000:
	mults.append(next_mult)
	next_mult += 5
	
sum = 0
for mult in list(set(mults)):
	sum += mult
print sum
