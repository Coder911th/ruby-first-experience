require 'csv'
require 'English'
require_relative 'console'
require_relative 'apartment'
require_relative 'apartment_type'
require_relative 'address'

# Database of apartments
class Database
  include Enumerable

  def each
    @apartments.each { |apartment| yield apartment }
  end

  def initialize(source)
    @source = source
    @apartments = []
    add_from_file(@source, false)
  rescue StandardError => message
    puts message
    exit 0
  end

  def add_from_file(path, save = true)
    path = File.expand_path(path)
    CSV.foreach(path) { |row| add_row(row) }
    commit if save
  rescue Errno::ENOENT
    raise "Файл '#{path}' не найден!"
  end

  def add(apartment, save = true)
    search_result = @apartments.find do |item|
      item.address == apartment.address && item.number_of_floors != apartment.number_of_floors
    end
    raise "У дома по адресу \"#{apartment.address}\" всего #{search_result.number_of_floors} этажей!" if search_result

    @apartments.append(apartment)
    commit if save
    @apartments.size - 1
  end

  def remove_by_index(index)
    @apartments.delete_at(index)
    commit
  end

  def remove(target)
    @apartments.delete(target)
    commit
  end

  def save(filename, aprt)
    minor_commit(filename, aprt)
  end

  private

  def print_error(reason)
    puts "Строка под номером #{$INPUT_LINE_NUMBER} имеет недопустимый формат. Причина: #{reason}."
  end

  def add_row(row)
    return print_error('Строка должна содержать 12 элементов разделенных запятыми') if row.size != 12

    begin
      apartment = Apartment.new
      apartment.footage = row[0]
      apartment.number_of_rooms = row[1]
      apartment.address = Address.new(row[2], row[3], row[4])
      apartment.number_of_floors = row[7]
      apartment.floor = row[5]
      apartment.type = ApartmentType.new(row[6])
      apartment.price = row[8]
      apartment.exchange = Address.new(row[9], row[10], nil, row[11])
      add(apartment, false)
    rescue StandardError => message
      print_error(message)
    end
  end

  def commit(filename = @source, apartments = @apartments)
    CSV.open(filename, 'wb') do |file|
      apartments.each do |apartment|
        file << apartment.to_a
      end
    end
  end

  def minor_commit(filename, aprt)
    filename = File.expand_path(filename)
    CSV.open(filename, 'wb') do |file|
      file << aprt.to_a
    end
  end
end
