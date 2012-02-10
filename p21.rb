require 'rubygems'
require 'ap'
require 'set'

class Fixnum

  @dcache = {}
  class << self; attr_reader :dcache; end

  @primes = [2]
  class << self; attr_reader :primes; end

  def d
    return self.class.dcache[self] if self.class.dcache[self]
    self.class.dcache[self] = divisors.reduce(:+) - self
  end

  def divisors 
    remainder = self
    divisor = self.class.primes[0]
    divisor_set = [1, self].to_set
    prime_index = 0 
    r2 = remainder / 2
    until divisor > r2 do
      if remainder % divisor == 0 then
        remainder /= divisor
        divisor_set << divisor
        divisor_set << self / divisor
        iterator = divisor_set.to_a
        iterator.each do |a| 
          iterator.each do |b|
            p = a * b
            if self % p == 0 then
              divisor_set << p 
              divisor_set << self / p
            end
          end
        end
      else
        if divisor >= self.class.primes.last
          divisor += 1 
        else
          prime_index += 1
          divisor = self.class.primes[prime_index]
        end
      end
    end
    self.class.primes << self if remainder == self && self > self.class.primes.last
    divisor_set
  end

  def amicable?
    _d = d
    (self != _d) && (self == _d.d)
  end

  def amicables
    (2..(self-1)).select do |i|
      ap i
      i.amicable?
    end
  end
end

ap 10000.amicables.reduce(:+)
