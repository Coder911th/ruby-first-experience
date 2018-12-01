require_relative 'converter'

# Console I/O Processing
module Console
  # Read a string from consolesss
  def self.read(message = nil)
    print message if message
    exit 0 if !input = gets
    input.to_s.chomp
  end

  # Log errors in block
  def self.try
    loop do
      begin
        return yield
      rescue StandardError => message
        puts message
      end
    end
  end

  def self.read_positive_int(message = nil)
    try do
      value = read(message)
      raise 'Введите целое неотрицательное число!' if !value = Converter.get_int(value)

      raise 'Введите неотрицательное число!' if value < 0

      value
    end
  end

  # Read required string
  def self.read_required(message = nil)
    loop do
      input = read(message).strip
      return input if !input.size.zero?

      puts 'Введите строку, содержащую хотя бы один символ!'
    end
  end

  # Clear console
  def self.clear
    system('clear') || system('cls')
  end

  # Input a number in range
  def self.choose(range)
    loop do
      print '> '
      choice = Converter.get_int(read)
      return choice if choice && range.include?(choice)

      puts "Введите число от #{range.min} до #{range.max}!"
    end
  end
end
