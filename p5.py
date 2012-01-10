import math
import itertools
import string

def factor(number):
	factors = []
	remainder = number
	f = 2
	while f <= remainder and f <= 999:
		if remainder % f == 0:
			factors.append(f)
			remainder /= f
			f = 1
		f += 1
	return factors

def factors_fit(factors, palindrome):
	factor_powerset = powerset(factors)
	for t in factor_powerset:
		factor_a = 1
		for f in t:
			factor_a *= f
		factor_b = palindrome / factor_a
		if digits(factor_a) == 3 and palindrome % factor_a == 0 and digits(factor_b) == 3:
			print factor_a, factor_b
			return True
	return False

def powerset(iterable):
	s = list(iterable)
    	return itertools.chain.from_iterable(itertools.combinations(s, r) for r in range(len(s)+1))

def digits(number):
	return len(str(number))

def decrement_digit(digit):
	return ((int(digit) + 10 - 1) % 10)

def next_largest_palindrome(palindrome):
	palindrome = list(str(palindrome))
	d = len(palindrome)

	modded = False
	pivot = 0
	if d % 2 == 0:
		centroid_index = d/2 - 1
		while not modded and pivot <= centroid_index:
			if int(palindrome[centroid_index-pivot]) != 0:
				palindrome[centroid_index-pivot] = str(decrement_digit(palindrome[centroid_index-pivot]))
				palindrome[centroid_index+pivot+1] = str(decrement_digit(palindrome[centroid_index+pivot+1]))
				modded = True
			else:
				i = 0
				while i <= pivot:
					palindrome[centroid_index-i] = str(9)
					palindrome[centroid_index+i+1] = str(9)
					i += 1
			pivot += 1	
	p = "".join(palindrome)
	return int(p)

palindrome = 999999
while palindrome >= 100000:
	factors = factor(palindrome)	
	if factors_fit(factors, palindrome):
		print "Found:", palindrome, factors
		break
	palindrome = next_largest_palindrome(palindrome)
