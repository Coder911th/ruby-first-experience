require_relative 'dialog'
require_relative 'main_menu'
require_relative '../console'

# Not implemented dialog
class NotImplementedDialog < Dialog
  private

  def render
    puts 'Not implemented'
    puts 'Чтобы вернуться в главное меню, нажмите клавишу ENTER...'
  end

  def controller
    Console.read
    show(MainMenu)
  end
end
