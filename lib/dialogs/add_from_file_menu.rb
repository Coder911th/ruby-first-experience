require_relative 'dialog'
require_relative 'information_dialog'
require_relative 'add_menu'
require_relative '../constants'
require_relative '../console'

# Menu add apartment from file
class AddFromFileMenu < Dialog
  private

  def render
    print 'Введите путь до файла относительно каталога data: '
  end

  def controller
    error_message = 'Загрузка из файла завершена!'
    begin
      @database.add_from_file("#{Constants::PATH_TO_DATA}/#{Console.read}")
    rescue StandardError => message
      error_message = message
    end
    show(InformationDialog, error_message)
    show(AddMenu)
  end
end
