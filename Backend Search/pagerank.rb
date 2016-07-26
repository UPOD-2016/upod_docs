#!/usr/bin/env ruby

class PageRank
  #parameter
  EPS = 0.00001
  
  def initialize(matrix)
    @dim = matrix.size

    @p = []
    @dim.times do |i|
     @p[i] = []
     @dim.times do |j|
       @p[i][j] = matrix[i][j] / (matrix[i].inject(:+) * 1.0)
     end
    end
  end

  def calc(curr,alpha)

    loop do
      prev = curr.clone

      @dim.times do |i|
        ip = 0
        @dim.times do |j|
          ip += @p.transpose[i][j] * prev[j]
        end
        curr[i] = (alpha * ip) + ((1.0 - alpha) / @dim * 1.0)
      end

      err = 0
      @dim.times do |i|
        err += (prev[i] - curr[i]).abs
      end

      if err < EPS
        return curr
      end
    end

  end
end

matrix = [[0,0,1,1],[0,0,1,1],[1,1,0,0],[0,1,1,0]]
init = [0.25,0.25,0.25,0.25]

pr = PageRank.new(matrix)

[1.0,0.8,0.5,0].each do |alpha|
  rank = pr.calc(init, alpha)

  puts "----------"
  puts "alpha: #{alpha}"
  p rank
end