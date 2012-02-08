require 'pp'
days_in_month = [0,31,28,31,30,31,30,31,31,30,31,30,31]

days = 1
ymd = [1900,1,1]

answer = 0
until ymd == [2000,12,31]
  y, m, d = ymd
  days += 1
  d += 1 

  d_i_m = days_in_month[m]
  if m == 2
    leap_year = (y%4 == 0 && (y%400 == 0 || y%100 != 0))
    d_i_m += 1 if leap_year
  end

  if d > d_i_m
    d = 1
    m += 1
    if m > 12
      m = 1
      y += 1
    end 
  end

  ymd = [y,m,d]
  ##pp ymd
  ##pp days

  answer += 1 if (days%7 == 0) && (d == 1) && (y >= 1901)
end

puts answer
