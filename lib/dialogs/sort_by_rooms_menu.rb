require_relative 'dialog'
require_relative 'find_apartment_menu'
require_relative 'apartments_list'
require_relative 'information_dialog'
require_relative '../console'

# Sort by rooms menu
class SortByRoomsMenu < Dialog
  private

  def render
    puts 'Сортировка по количеству комнат'
  end

  def controller
    sorted = @database.sort do |a, b|
      a.number_of_rooms - b.number_of_rooms
    end
    show(ApartmentsList, items: sorted)
    show(InformationDialog)
    show(FindApartmentMenu)
  end
end
