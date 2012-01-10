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

def is_sublist(big_list, small_list):
	big_list   = list(big_list)
	small_list = list(small_list)
	found = False
	for s in small_list:
		for b in big_list:
			if s == b:
				found = True
				big_list.remove(s)
				break
			found = False
	return found

i = 1
list_of_factors = []
while i <= 20:
	factors = factor(i)
	list_of_factors.append(factors)
	i += 1

print list_of_factors
for factors_a in list(list_of_factors):
	for factors_b in list_of_factors:
		print factors_a, factors_b
		if factors_a != factors_b:
			if is_sublist(factors_b, factors_a):
				list_of_factors.remove(factors_a)
				break
			else:
				for f_a in factors_a:
					found = False
					for f_b in factors_b:
						if f_a == f_b:
							factors_b.remove(f_a)
							found = True
							break
					if found: break

print list_of_factors

product = 1
for factors in list_of_factors:
	for f in factors:
		product *= f
print product
