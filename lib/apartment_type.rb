# Type of appartment
class ApartmentType
  attr_reader :name
  ALLOWED_TYPES = %w[ПАНЕЛЬНЫЙ КИРПИЧНЫЙ].freeze

  def initialize(type)
    type = type.to_s.upcase
    @key = ALLOWED_TYPES.find_index(type)
    raise "Указан недопустимый тип дома! ('#{type}')" if !@key

    @name = ALLOWED_TYPES[@key]
  end

  def to_s
    name.capitalize
  end
end
