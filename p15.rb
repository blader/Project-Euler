require 'pp'
sum = 0
ones_digit = ["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"].collect {|i| i.length }
tens_digit = {1 => 0, 2 => 6, 3 => 6, 4 => 5, 5 => 5, 6 => 5, 7 => 7, 8 => 6, 9 => 6, 0 => 0}
double_digit = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"].collect {|i| i.length}

(1..999).each do |n|
  n_length = 0
  digits = n.to_s.chars.to_a.collect {|d| d.to_i}.reverse
  digits.each_index do |i|
    d = digits[i]
    case i
    when 0
      if digits[1] && digits[1] == 1 then
        n_length += double_digit[d]
      else
        n_length += ones_digit[d]
      end
    when 1
      n_length += tens_digit[d]
    when 2 
      n_length += ones_digit[d]
      n_length += 7 
      n_length += 3 unless n % 100 == 0
    end
  end
  sum += n_length
  puts  "#{n}: #{n_length}: #{sum}"
end
sum += 11
puts  "#{sum}"
