# x = 'Привет'
# pp x
# puts x.encoding

# z = gets
# pp z
# puts z.encoding

# pp '   фыв   '.strip.capitalize

#
class X
  attr_accessor :v

  def initialize(z)
    @v = z
  end

  def ==(o)
    @v == o.v
  end
end

# pp X.new(3) == X.new(5)

[X.new(2), X.new(4), X.new(-1)].sort_by { :&.v }
