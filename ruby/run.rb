
require_relative 'convert'

def greet(name)
  puts "Hi #{name}! Welcome to Dudley's Pig Emporkium"
end

test_cases = [
    {
        number: 4,
        base: 2,
        expected: '100'
    },
    {
        number: 322,
        base: 16,
        expected: '142'
    },
    {
        number: 187,
        base: 2,
        expected: '10111011'
    },
    {
        number: 748,
        base: 20,
        expected: '1h8'
    },
    {
        number: 166,
        base: 22,
        expected: '7c'
    },
    {
        number: 883,
        base: 16,
        expected: '373'
    },
    {
        number: 217,
        base: 32,
        expected: '6p'
    },
    {
        number: 447,
        base: 24,
        expected: 'if'
    },
    {
        number: 507,
        base: 13,
        expected: '300'
    },
    {
        number: 800,
        base: 20,
        expected: '200'
    },
    {
        number: 188,
        base: 20,
        expected: '98'
    },
    {
        number: 665,
        base: 10,
        expected: '665'
    },
    {
        number: 861,
        base: 34,
        expected: 'pb'
    },
    {
        number: 425,
        base: 30,
        expected: 'e5'
    },
    {
        number: 868,
        base: 29,
        expected: '10r'
    },
    {
        number: 930,
        base: 14,
        expected: '4a6'
    },
    {
        number: 979,
        base: 21,
        expected: '24d'
    },
    {
        number: 806,
        base: 3,
        expected: '1002212'
    },
    {
        number: 755,
        base: 21,
        expected: '1ek'
    },
    {
        number: 12,
        base: 10,
        expected: '12'
    },
    {
        number: 586,
        base: 17,
        expected: '208'
    },
    {
        number: 663,
        base: 36,
        expected: 'if'
    },
    {
        number: 964,
        base: 34,
        expected: 'sc'
    },
    {
        number: 750,
        base: 36,
        expected: 'ku'
    },
    {
        number: 731,
        base: 8,
        expected: '1333'
    },
    {
        number: 874,
        base: 9,
        expected: '1171'
    },
    {
        number: 613,
        base: 28,
        expected: 'lp'
    },
    {
        number: 487,
        base: 36,
        expected: 'dj'
    },
    {
        number: 998,
        base: 14,
        expected: '514'
    },
    {
        number: 9,
        base: 12,
        expected: '9'
    },
    {
        number: 181,
        base: 10,
        expected: '181'
    },
    {
        number: 523,
        base: 34,
        expected: 'fd'
    },
    {
        number: 960,
        base: 22,
        expected: '1le'
    },
    {
        number: 31,
        base: 29,
        expected: '12'
    },
    {
        number: 746,
        base: 36,
        expected: 'kq'
    },
    {
        number: 903,
        base: 36,
        expected: 'p3'
    },
    {
        number: 486,
        base: 15,
        expected: '226'
    },
    {
        number: 906,
        base: 7,
        expected: '2433'
    },
    {
        number: 992,
        base: 30,
        expected: '132'
    },
    {
        number: 588,
        base: 33,
        expected: 'hr'
    },
    {
        number: 341,
        base: 29,
        expected: 'bm'
    },
    {
        number: 760,
        base: 19,
        expected: '220'
    },
    {
        number: 878,
        base: 7,
        expected: '2363'
    },
    {
        number: 85,
        base: 7,
        expected: '151'
    },
    {
        number: 10,
        base: 5,
        expected: '20'
    },
    {
        number: 544,
        base: 36,
        expected: 'f4'
    },
    {
        number: 4,
        base: 27,
        expected: '4'
    },
    {
        number: 401,
        base: 19,
        expected: '122'
    },
    {
        number: 766,
        base: 24,
        expected: '17m'
    },
    {
        number: 622,
        base: 19,
        expected: '1de'
    },
    {
        number: 349,
        base: 32,
        expected: 'at'
    },
    {
        number: 989,
        base: 34,
        expected: 't3'
    },
    {
        number: 540,
        base: 12,
        expected: '390'
    },
    {
        number: 102,
        base: 8,
        expected: '146'
    },
    {
        number: 876,
        base: 4,
        expected: '31230'
    },
    {
        number: 677,
        base: 26,
        expected: '101'
    },
    {
        number: 705,
        base: 10,
        expected: '705'
    },
    {
        number: 773,
        base: 17,
        expected: '2b8'
    },
    {
        number: 513,
        base: 15,
        expected: '243'
    },
    {
        number: 946,
        base: 22,
        expected: '1l0'
    },
    {
        number: 991,
        base: 16,
        expected: '3df'
    },
    {
        number: 754,
        base: 32,
        expected: 'ni'
    },
    {
        number: 647,
        base: 24,
        expected: '12n'
    },
    {
        number: 757,
        base: 18,
        expected: '261'
    },
    {
        number: 27,
        base: 25,
        expected: '12'
    },
    {
        number: 106,
        base: 29,
        expected: '3j'
    },
    {
        number: 760,
        base: 33,
        expected: 'n1'
    },
    {
        number: 50,
        base: 22,
        expected: '26'
    },
    {
        number: 689,
        base: 26,
        expected: '10d'
    },
    {
        number: 996,
        base: 17,
        expected: '37a'
    },
    {
        number: 768,
        base: 36,
        expected: 'lc'
    },
    {
        number: 408,
        base: 18,
        expected: '14c'
    },
    {
        number: 744,
        base: 14,
        expected: '3b2'
    },
    {
        number: 389,
        base: 16,
        expected: '185'
    },
    {
        number: 827,
        base: 17,
        expected: '2eb'
    },
    {
        number: 968,
        base: 28,
        expected: '16g'
    },
    {
        number: 995,
        base: 23,
        expected: '1k6'
    },
    {
        number: 2,
        base: 16,
        expected: '2'
    },
    {
        number: 404,
        base: 17,
        expected: '16d'
    },
    {
        number: 651,
        base: 5,
        expected: '10101'
    },
    {
        number: 521,
        base: 14,
        expected: '293'
    },
    {
        number: 107,
        base: 10,
        expected: '107'
    },
    {
        number: 384,
        base: 3,
        expected: '112020'
    },
    {
        number: 270,
        base: 34,
        expected: '7w'
    },
    {
        number: 868,
        base: 20,
        expected: '238'
    },
    {
        number: 655,
        base: 31,
        expected: 'l4'
    },
    {
        number: 334,
        base: 9,
        expected: '411'
    },
    {
        number: 99,
        base: 10,
        expected: '99'
    },
    {
        number: 115,
        base: 18,
        expected: '67'
    },
    {
        number: 181,
        base: 27,
        expected: '6j'
    },
    {
        number: 790,
        base: 18,
        expected: '27g'
    },
    {
        number: 495,
        base: 30,
        expected: 'gf'
    },
    {
        number: 756,
        base: 20,
        expected: '1hg'
    },
    {
        number: 949,
        base: 18,
        expected: '2gd'
    },
    {
        number: 91,
        base: 18,
        expected: '51'
    },
    {
        number: 566,
        base: 25,
        expected: 'mg'
    },
    {
        number: 801,
        base: 35,
        expected: 'mv'
    },
    {
        number: 813,
        base: 11,
        expected: '67a'
    },
    {
        number: 762,
        base: 33,
        expected: 'n3'
    },
    {
        number: 43,
        base: 26,
        expected: '1h'
    }
]

puts "Running #{test_cases.count} tests"
test_cases.each do |test|
  output = Converter.new(test[:number]).to_base(test[:base])
  # output = test[:number].to_base test[:base]

  unless output == test[:expected]
    puts "Failed to convert #{test[:number]} to base #{test[:base]} (got #{output}, #{test[:expected]} expected)"
  end
end
puts 'Tests complete'


# str = "test_cases = [\n"
# 100.times do
#   base = (2..36).to_a.sample
#   number = (1..1000).to_a.sample
#   str << "{\nnumber: #{number},\nbase: #{base},\nexpected: '#{number.to_s base}'\n},\n"
# end
# str << "\n]"
# puts str
