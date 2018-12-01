require_relative 'dialog'
require_relative 'add_menu'
require_relative 'remove_menu'
require_relative 'find_apartment_menu'
require_relative '../console'

# Main menu
class MainMenu < Dialog
  private

  def render
    puts '1) Добавить квартиру в базу'
    puts '2) Удалить квартиру из базы'
    puts '3) Найти квартиру'
    puts '4) Выйти'
  end

  def controller
    case Console.choose(1..4)
    when 1
      show(AddMenu)
    when 2
      show(RemoveMenu)
    when 3
      show(FindApartmentMenu)
    when 4
      exit 0
    end
  end
end
