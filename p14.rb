require 'pp'
print (2**1000).to_s.chars.reduce(0) {|s, d| s+= d.to_i}
