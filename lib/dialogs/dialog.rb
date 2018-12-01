require_relative '../console'

# Base dialog
class Dialog
  def initialize(database, params = nil, new_page = true)
    @database = database
    @params = params
    show_header if new_page
    render
    controller
  end

  def show(window_class, params = nil)
    window_class.new(@database, params)
  end

  private

  def render
    'Not implemented'
  end

  def controller
    'Not implemented'
  end

  def show_header
    Console.clear
    puts 'Обмен квартирами Desktop 2018 PRO'
  end
end
