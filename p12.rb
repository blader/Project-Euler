
class Fixnum
  def count_divisors
    self
  end
end

tri_list = [1]
while tri_list.length <= 1000 do
  tri_list << tri_list[-1] + tri_list.length + 1
  print "\n#{tri_list[-1]}\n"
  print tri_list[-1].count_divisors
end


