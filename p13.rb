require 'pp'

N = 10

FoundCache = {}
def traverse(row=0, col=0)
  return FoundCache[[row,col]] if FoundCache[[row,col]]
  paths_here = 0
  paths_here += traverse(row+1, col) unless row == N 
  paths_here += traverse(row, col+1) unless col == N 
  paths_here += 1 if row == N && col == N
  FoundCache[[row, col]] = paths_here
  paths_here
end
puts "answer: #{traverse}"
