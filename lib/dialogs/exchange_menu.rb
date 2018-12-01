require_relative 'dialog'
require_relative 'apartments_list'
require_relative 'apartment_saver'
require_relative 'find_apartment_menu'
require_relative '../console'

# Excange menu
class ExchangeMenu < Dialog
  private

  def render
    @aprt = @params
    puts
    puts 'Ваша квартира:'
    puts @aprt
    puts
  end

  def controller
    list = @database.find_all do |elem|
      elem.address.district == @aprt.exchange.district &&
        elem.address.street == @aprt.exchange.street &&
        elem.floor == @aprt.exchange.floor
    end

    if list.empty?
      puts 'Обмен невозможен'
      show(FindApartmentMenu)
    else
      show(SelectMenu, list_params: { items: list, surcharge: @aprt.price },
                       message: 'Введите номер квартиры, которую хотите обменять: ',
                       next_phase: ApartmentSaver,
                       clear: false,
                       caption: 'Предложения:')
    end
  end
end
