require_relative 'dialog'
require_relative 'find_apartment_menu'
require_relative 'apartments_list'
require_relative 'information_dialog'
require_relative '../console'

# Filter by price
class FilterByPrice < Dialog
  private

  def render
    puts 'Отобрать по цене'
  end

  def controller
    min = Console.read_positive_int('от ')
    max = 0
    Console.try do
      max = Console.read_positive_int('до ')
      raise 'Верхняя граница должна быть не меньше, чем нижняя' if max < min
    end
    in_range = @database.find_all do |item|
      item.price.between?(min, max)
    end
    sorted = in_range.sort { |a, b| a.price - b.price }
    puts
    show(ApartmentsList, items: sorted)
    show(InformationDialog)
    show(FindApartmentMenu)
  end
end
