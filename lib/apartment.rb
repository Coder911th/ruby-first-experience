require_relative 'apartment_type'
require_relative 'converter'

# The base class of apartment
class Apartment
  include Enumerable
  attr_reader :footage,
              :number_of_rooms,
              :address,
              :floor,
              :type,
              :number_of_floors,
              :price,
              :exchange

  def each
    yield footage
    yield number_of_rooms
    yield address.district
    yield address.street
    yield address.house
    yield floor
    yield type
    yield number_of_floors
    yield price
    yield exchange.district
    yield exchange.street
    yield exchange.floor
  end

  # apartment: Hash({
  #     footage {int}
  #     number_of_rooms {int}
  #     address {Address}
  #     floor {int}
  #     type {ApartmesntType}
  #     number_of_floors {int}
  #     price {float}
  # }) Parameters of apartment
  # exchange_address {Address} Parameters of exchange
  def initialize(apartment = {}, exchange_address = nil)
    @footage = apartment[:footage]
    @number_of_rooms = apartment[:number_of_rooms]
    @address = apartment[:address] || Address.new
    @floor = apartment[:floor]
    @type = apartment[:type]
    @number_of_floors = apartment[:number_of_floors]
    @price = apartment[:price]
    @exchange = exchange_address || Address.new
  end

  def to_s
    "#{@address}\n" \
      "Этаж: #{@floor} Комнаты: #{@number_of_rooms} Метраж: #{@footage}\n" \
      "Вид дома: #{@type}\n" \
      "Всего этажей: #{@number_of_floors}\n" \
      "Стоимость: #{@price} руб.\n" \
      "Обмен возможен: #{@exchange}"
  end

  def footage=(value)
    if !(value = Converter.get_float(value)) || value <= 0.0
      raise 'Метраж квартиры дожен задаваться действительным положительным числом!'
    end

    @footage = value
  end

  def number_of_rooms=(value)
    if !(value = Converter.get_int(value)) || value <= 0
      raise 'Число комнат должно задаваться натуральным числом!'
    end

    @number_of_rooms = value
  end

  def address=(value)
    @address = value.clone
  end

  def floor=(value)
    if !(value = Converter.get_int(value)) || value <= 0
      raise 'Номер этажа должен задаваться натуральным числом!'
    end

    raise "В доме всего #{@number_of_floors} этажей!" if value > @number_of_floors

    @floor = value
  end

  def type=(value)
    @type = ApartmentType.new(value)
  end

  def number_of_floors=(value)
    if !(value = Converter.get_int(value)) || value <= 0
      raise 'Число этажей должно задаваться натуральным числом!'
    end

    @number_of_floors = value
  end

  def price=(value)
    if !(value = Converter.get_float(value)) || value < 0.0
      raise 'Стоимость должна быть неотрицательным действительным числом!'
    end

    @price = value
  end

  def exchange=(value)
    @exchange = value.clone
  end
end
