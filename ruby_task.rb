#1. Вирішити 15 задач із наступного списку мовою Рубі
#1. Дано цілочисельний масив. Неохідно вивести спочатку його елеементи з парними індексами, а потім - з непарними.
arr = [5, 2, 6, 9, 8, 3]
even_indices = arr.each_index.select { |i| i.even? }.map { |i| arr[i] }
odd_indices = arr.each_index.select { |i| i.odd? }.map { |i| arr[i] }
puts even_indices[1..-1] + odd_indices[0..-1] + [even_indices[0]]

#3. Дано цілочисельний масив. Вивести номер першого з тих елеементів, які задовольняють подвійні нерівності: A[0] < A[i] < A[-1]. Якщо таких елементів немає, то вивести [ ].
arr = [-5, 0.2, 8, -0.9, 0.4]
index = arr.each_index.find { |i| arr[0] < arr[i] && arr[i] < arr[-1] }
if index
  puts index
else
  puts "[]"
end

#5. Дано цілочисельний масив. Перетворити його, додавши до парних чисел перший елемент. Перший і останній елеементи масиву не змінювати.
arr = [3, 4, 7, 8, 5]
first = arr[0]
(1...arr.length - 1).each do |i|
  arr[i] += first if arr[i].even?
end
puts arr.inspect

#9. Дано цілочисельний масив. Замінити всі додатні елементи на значення мінімального.
arr = [5, -3, 0, 8, -1]
min = arr.min
arr.map! do |x|
  x > 0 ? min : x
end
puts arr.inspect

#13. Дано цілочисельний масив. Здійснити циклічний зсув елеементів масиву вліво на одну позицію.
arr = [1, 2, 3, 4, 5]
arr = arr.rotate(1)
puts arr.inspect

#15. Дано цілочисельний масив. Перевірити, чи утворюють елементи арифметичну прогресію. Якщо так, то вивести різницю прогресії, якщо ні - вивести nill.
arr = [2, 4, 6, 8, 10]
if arr.size < 2
  puts nill
else
  d = arr[1] - arr[0]
  is_arithmetic = true
  for i in 1...(arr.size - 1)
    if arr[i + 1] - arr[i] !=d
      is_arithmetic = false
      break
    end
  end
  puts is_arithmetic ? d : nill
end

#17. Дано цілочисельний масив. Знайти кількість його локальних максимумів.
arr = [1, 5, 3, 4, 2, 6, 1]
count = 0
for i in 1...(arr.size - 1)
  if arr[i] > arr[i - 1] && arr[i] > arr[i + 1]
    count += 1
  end
end
puts count

#19. Дано цілочисельний масив. Знайти максимальний з його локальних максимумів.
arr = [1, 5, 3, 4, 2, 6, 1]
def local_maxima(arr)
  maxima = []
  (1..arr.size-2).each do |i|
    if arr[i] > arr[i-1] && arr[i] > arr[i+1]
      maxima << arr[i]
    end
  end
  maxima
end
maxima = local_maxima(arr)
if maxima.empty?
  puts nill
else
  puts maxima.max
end

#21. Дано цілочисельний масив. Визначити кількість ділянок, на яких його елементи монотонно зростають.
arr = [1, 2, 3, 1, 2, 3, 4, 1, 5, 6]
def count_increasing_segments(arr)
  count = 0
  i = 0
  while i < arr.length - 1
    if arr[i] < arr[i+1]
      count +=1
      while i < arr.length - 1 && arr[i] < arr[i+1]
        i += 1
      end
    end
    i += 1
  end
  count
end

#24. Дано дійсне число R і масив дійсних чисел. Знайти елемент масиву, який найменш близький до даного числа.
arr = [1.5, 2.3, 3.7, 0.4, 5.6]
R = 2.8
def furthest_from_r(arr, r)
  furthest = arr[0]
  max_diff = (arr[0] - r).abs
  arr.each do |num|
    diff = (num - r).abs
    if diff > max_diff
      max_diff = diff
      furthest = num
    end
  end
  furthest
end
puts furthest_from_r(arr, R)

#26. Дано цілочисельний масив. Перетворити його, вставивши перед кожним від'ємним елементом нульовий елемент.
arr = [3, -1, 4, -2, 5, -3]
result = []
arr.each do |num|
  if num < 0
    result.push(0)
  end
  result.push(num)
end
puts result.inspect

#30. Дано цілочисельний масив. Упорядкувати його за спаданням.
arr = [30, 1, 4, 20, 5, 9, 2, 6, 14, 3, 5]
sorted_arr = arr.sort.reverse
puts sorted_arr.inspect

#31. Дано цілочисельний масив. Вивести індекси масиву в тому порядку,  в якому відповідні їм елементи утворюють спадну послідовність.
arr = [30, 1, 4, 20, 5, 9, 2, 6, 14, 3, 5]
sorted_indices = arr.each_with_index.sort_by { |value, index| -value }.map { |value, index| index }
puts sorted_indices.inspect

#33. Дано цілочисельний масив. Знайти індекс мінімального елемента.
arr = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]
min_index = arr.index(arr.min)
puts min_index

#82. Дано число A і натуральне число N. Знайти результат такого виразу 1 + A + A*2 + A*3 + ... + A*N
A = 2
N = 5
sum = 1 + (1..N).sum { |i| A * i }
puts sum

#2. Створити просту програму на Ruby, яка виконує основні арифметичні дії, такі як додавання, віднімання,
#множення та ділення. Це завдання допоможе зрозуміти основний синтаксис та операції мови Ruby.
def calculator(a, b, operation)
  case operation
  when '+'
    a + b
  when '-'
    a - b
  when '*'
    a * b
  when '/'
    if b != 0
      a.to_f / b
    else
      "Помилка: ділення на нуль"
    end
  else
    "Невідома операція"
  end
end

print "Введіть перше число: "
num1 = gets.chomp.to_f

print "Введіть друге число: "
num2 = gets.chomp.to_f

print "Виберіть операцію (+, -, *, /): "
op = gets.chomp

result = calculator(num1, num2, op)
puts "Результат: #{result}"

#3. Потрібно знайти коректний , який допоможе імплементувати наступний функціонал
#3.1 Сценарій: Необхідно запланувати регулярні фонові завдання, такі як відправлення щотижневих електронних листів або генерація звітів опівночі.
Gem: sidekiq-scheduler
#3.2 Сценарій: Ваш веб-додаток потребує безпечного управління завантаженням файлів, включаючи зображення та документи, і можливо зберігати їх у хмарному сервісі.
Gem: shrine
#3.3 Сценарій: Ваш веб-сайт містить розділ з великою кількістю статей зросла до сотень або навіть тисяч, і відвідувачам сайту стає важко знайти потрібну інформацію.
#Вам потрібен ефективний спосіб організувати показ цих статей, щоб користувачі могли легко переглядати їх, не загрузнувши у великій кількості контенту на одній сторінці.
Gem: kaminari
