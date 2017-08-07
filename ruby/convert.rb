
def to_base_2(number)

  converted = []

  (0..4).reverse_each do |decimal_place|
    bit = 0

    if number >= 2**decimal_place
      bit = 1
      number -= 2**decimal_place
    end

    converted << bit
  end

  return converted
end
