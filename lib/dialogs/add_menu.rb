require_relative 'dialog'
require_relative 'main_menu'
require_relative 'add_from_file_menu'
require_relative 'add_from_console_menu'
require_relative '../console'

# Add apartment menu
class AddMenu < Dialog
  private

  def render
    puts 'Добавление новой квартиры в базу'
    puts '1) Загрузить из файла'
    puts '2) Ввести вручную'
    puts '3) Вернуться'
  end

  def controller
    case Console.choose(1..3)
    when 1
      show(AddFromFileMenu)
    when 2
      show(AddFromConsoleMenu)
    when 3
      show(MainMenu)
    end
  end
end
