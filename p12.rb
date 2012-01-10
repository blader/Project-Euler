require 'rubygems'
require 'set'
require 'ap'

class Fixnum
  def triangle
    return self if self == 1
    half_size = self/2
    (self+1) * half_size + (self%2 == 0 ? 0 : half_size+1)
  end

  def divisors 
    remainder = self
    divisor = 2
    divisor_set = [1, self].to_set
    until divisor > remainder / 2 do
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
        divisor += 1
      end
    end
    divisor_set
  end

end

i = 0
while true do
  i += 1
  t = i.triangle
  c = t.divisors.length
    print "#{i} - Triangle: #{t}  "
    print " Divisors: #{c}\n"
  if c > 500 then
    break
  end
end
