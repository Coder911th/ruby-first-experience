require_relative 'dialog'
require_relative 'apartments_list'
require_relative 'main_menu'
require_relative '../console'
require_relative '../converter'

# Remove menu
class RemoveMenu < Dialog
  private

  def render
    show(ApartmentsList, items: @database)
    puts 'Введите номер квартиры, которую хотите удалить из базы или -1, если передумали.'
  end

  def controller
    number = -1
    Console.try do
      number = Converter.get_int(Console.read('> '))
      raise 'Введите целое число' if !number

      break if number == -1

      raise 'Квартира с указанным номером не найдена!' if !@database.to_a[number]
    end

    @database.remove_by_index(number) if number != -1
    show(MainMenu)
  end
end
