require_relative 'dialog'
require_relative 'apartments_list'
require_relative '../console'

# Select menu
class SelectMenu < Dialog
  private

  def initialize(db, params)
    super(db, params, params.key?(:clear) && params[:clear])
  end

  def render
    puts @params[:caption] || 'Выбор квартиры'
    show(ApartmentsList, @params[:list_params])
  end

  def controller
    list = @params[:list_params][:items]
    number = Console.try do
      number = Console.read_positive_int(@params[:message])
      raise 'Квартира с указанным номером не найдена!' if !list.to_a[number]

      number
    end
    show(@params[:next_phase], list.to_a[number])
  end
end
