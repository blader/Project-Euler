n = 100
f = (1..n).to_a.reduce(1){|p, i| p *= i} 
puts f
puts f.to_s.chars.reduce(0){|s,i| s+= i.to_i}

