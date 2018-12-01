require_relative 'dialog'
require_relative 'find_apartment_menu'
require_relative 'information_dialog'
require_relative '../console'
require_relative '../constants'

# Apartment saver
class ApartmentSaver < Dialog
  private

  def render
    puts 'Данные о выбранной квартире будут выгружены в файл.'
  end

  def controller
    filename = Console.read('Введите название файла: ')
    begin
      @database.save("#{Constants::PATH_TO_DATA}/#{filename}", @params)
      @database.remove(@params)
    rescue StandardError => message
      puts message
    end
    show(InformationDialog)
    show(FindApartmentMenu)
  end
end
