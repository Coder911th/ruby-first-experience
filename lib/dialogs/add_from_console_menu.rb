require_relative 'dialog'
require_relative 'information_dialog'
require_relative 'add_menu'
require_relative '../console'
require_relative '../apartment'
require_relative '../address'

# Menu add apartment from console
class AddFromConsoleMenu < Dialog
  private

  def render
    puts 'Заполните информацию о новой квартире'
  end

  def read_address
    address = Address.new
    address.district = Console.read_required('Район: ')
    address.street = Console.read_required('Улица: ')
    address.house =  Console.read_required('Дом: ')
    address
  end

  def read_exchange_address
    address = Address.new
    address.district = Console.read_required('Район: ')
    address.street = Console.read_required('Улица: ')
    Console.try { address.floor = Console.read('Этаж: ') }
  end

  def controller
    Console.try do
      apartment = Apartment.new
      apartment.address = read_address
      Console.try { apartment.number_of_floors = Console.read('Всего этажей в доме: ') }
      Console.try { apartment.floor = Console.read('Этаж квартиры: ') }
      Console.try { apartment.number_of_rooms = Console.read('Количество комнат: ') }
      Console.try { apartment.footage = Console.read('Метраж: ') }
      Console.try { apartment.type = Console.read('Вид дома (Панельный/Кирпичный): ') }
      Console.try { apartment.price = Console.read('Стоимость: ') }
      puts 'Возможен обмен при условиях:'
      apartment.exchange = read_exchange_address
      @database.add(apartment)
    end
    show(InformationDialog, "#{apartment}\nКвартира успешно добавлена в базу данных!")
    show(AddMenu)
  end
end
