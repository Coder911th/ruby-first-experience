require_relative 'dialog'
require_relative '../console'

# List of Apartments
class ApartmentsList < Dialog
  def initialize(db, params)
    super(db, params, false)
  end

  private

  def compute_surcharge(apartment)
    diff = apartment.price - @params[:surcharge]
    if diff > 0
      puts "Вам нужно доплатить: #{diff} руб."
    elsif diff < 0
      puts "Вам доплатят: #{diff} руб."
    else
      puts 'Обмен без доплаты'
    end
  end

  def render
    if @params[:items].count.zero?
      puts 'Не найдено ни одной квартиры'
    else
      @params[:items].each_with_index do |apartment, index|
        puts "\n№#{index}"
        puts apartment
        compute_surcharge(apartment) if @params.key? :surcharge
      end
    end
    puts
  end

  def controller; end
end
