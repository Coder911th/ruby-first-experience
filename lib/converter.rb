# Module has a methods for getting types from a string
module Converter
  def self.get_float(string)
    Float(string)
  rescue StandardError
    nil
  end

  def self.get_int(string)
    Integer(string)
  rescue StandardError
    nil
  end
end
