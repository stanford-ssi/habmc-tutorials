
def to_base_2(number)

  max_decimal_place = Math.log2(number).ceil

  converted = (0..max_decimal_place).reverse_each.map do |decimal_place|
    bit = 0

    if number >= 2**decimal_place
      bit = 1
      number -= 2**decimal_place
    end

    bit
  end

  converted.join
end
