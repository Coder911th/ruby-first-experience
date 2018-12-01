require_relative 'dialog'
require_relative '../console'

# Information dialog
class InformationDialog < Dialog
  def initialize(db, params)
    super(db, params, false)
  end

  private

  def render
    puts @params if @params
    puts 'Нажмите клавишу ENTER, чтобы продолжить...'
  end

  def controller
    Console.read
  end
end
