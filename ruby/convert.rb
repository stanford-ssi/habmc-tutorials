
class Converter

  def initialize(number)
    @number = number
  end

  def to_base(base)

    number = @number

    max_decimal_place = (Math.log(number) / Math.log(base)).floor

    converted = (0..max_decimal_place).reverse_each.map do |decimal_place|
      bit = 0

      while number >= base**decimal_place
        bit += 1
        number -= base**decimal_place
      end

      bit
    end

    converted.map! do |digit|
      digit = ('a'..'z').to_a[digit - 10] if digit >= 10

      digit
    end

    converted.join
  end
end

class Integer
  def to_base(base)

    number = self

    max_decimal_place = (Math.log(number) / Math.log(base)).floor

    converted = (0..max_decimal_place).reverse_each.map do |decimal_place|
      bit = 0

      while number >= base**decimal_place
        bit += 1
        number -= base**decimal_place
      end

      bit
    end

    converted.map! do |digit|
      digit = ('a'..'z').to_a[digit - 10] if digit >= 10

      digit
    end

    converted.join
  end
end
