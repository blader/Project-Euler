value = {}
(1..1000).each do |a|
  print "\n\n#{a} "
  ((a+1)..1000).each do |b|  
    print "#{b} "
    c = 1000 - a - b
    value = {:a => a, :b => b, :c => c} if (a*a + b*b) == c*c
    break if value[:a]
  end
  break if value[:a]
end
print "Found: #{value[:a]} + #{value[:b]} = #{value[:c]}\n"
print "Found: #{value[:a] * value[:b] * value[:c]}\n"
