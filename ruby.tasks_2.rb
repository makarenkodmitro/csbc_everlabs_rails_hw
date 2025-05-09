#1. Завдання: Створити програму на Ruby для знаходження найчастішого елемента в масиві.
puts "Введіть масив цілих чисел:"
input = gets.chomp

numbers = input.split.map(&:to_i)

frequency = Hash.new(0)
numbers.each { |num| frequency[num] += 1 }

max_freq = frequency.values.max

most_frequent = frequency.select { |_, count| count == max_freq }.keys

puts "Найчастіший(-і) елемент(-и): #{most_frequent.join(', ')}"

#2. Створити програму на Ruby для перетворення речення на Pig Latin.
puts "Введіть речення:"
sentence = gets.chomp

def to_pig_latin(word)
  punctuation = ''
  if word[-1] =~ /[[:punct:]]/
    punctuation = word[-1]
    word = word[0...-1]
  end

  first_letter = word[0]
  rest = word[1..] || ''

  pig_word = rest + first_letter.downcase + "ay"

  pig_word = pig_word.capitalize if first_letter == first_letter.upcase

  pig_word + punctuation
end

converted = sentence.split.map { |word| to_pig_latin(word) }.join(" ")

puts "Pig Latin: #{converted}"