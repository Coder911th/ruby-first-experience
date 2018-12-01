require_relative 'dialog'
require_relative 'find_apartment_menu'
require_relative 'apartments_list'
require_relative 'information_dialog'
require_relative 'find_apartment_menu'
require_relative '../console'

# Sort by district menu
class SortByDistrictMenu < Dialog
  private

  def render
    puts 'Отсортированы по району:'
  end

  def controller
    sorted = @database.sort do |a, b|
      a.address.district <=> b.address.district
    end
    show(ApartmentsList, items: sorted)
    show(InformationDialog)
    show(FindApartmentMenu)
  end
end
