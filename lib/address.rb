# Address structure
class Address
  include Comparable
  attr_reader :district, :street, :house, :floor

  def ==(other)
    @district.casecmp(other.district).zero? &&
      @street.casecmp(other.street).zero? &&
      @house.casecmp(other.house).zero?
  end

  def district=(value)
    @district = value.to_s.strip.capitalize
  end

  def street=(value)
    @street = value.to_s.strip.capitalize
  end

  def house=(value)
    @house = value.to_s.strip.capitalize
  end

  def floor=(value)
    if !(value = Converter.get_int(value)) || value <= 0
      raise 'Номер этажа должен задаваться натуральным числом!'
    end

    @floor = value
  end

  def initialize(district = nil, street = nil, house = nil, floor = nil)
    @district = district.to_s.strip.capitalize
    @street = street.to_s.strip.capitalize
    @house = house.to_s.strip.capitalize
    if floor
      self.floor = floor
    else
      @floor = floor
    end
  end

  def to_s
    str = ''
    str += "#{@district.strip} р-н. " if !@district.empty?
    str += "ул. #{@street.strip} " if !@street.empty?
    str += "д.#{@house.strip}" if !@house.empty?
    str += "#{@floor} этаж" if @floor.nil?
    str
  end
end
