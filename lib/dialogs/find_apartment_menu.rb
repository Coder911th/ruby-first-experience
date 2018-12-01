require_relative 'dialog'
require_relative 'main_menu'
require_relative 'not_implemented_dialog'
require_relative 'sort_by_district_menu'
require_relative 'sort_by_rooms_menu'
require_relative 'filter_by_price'
require_relative 'select_menu'
require_relative 'exchange_menu'
require_relative '../console'

# Find apartment menu
class FindApartmentMenu < Dialog
  private

  def render
    puts '1) Поиск для обмена'
    puts '2) Отсортировать по районам'
    puts '3) Отсортировать по количеству комнат'
    puts '4) Поиск по ценовому диапазону'
    puts '5) Вернуться'
  end

  def controller
    case Console.choose(1..5)
    when 1
      show(SelectMenu, list_params: { items: @database },
                       message: 'Введите номер квартиры, которую хотите обменять: ',
                       next_phase: ExchangeMenu)
    when 2
      show(SortByDistrictMenu)
    when 3
      show(SortByRoomsMenu)
    when 4
      show(FilterByPrice)
    when 5
      show(MainMenu)
    end
  end
end
