#5. Зчитати JSON-файл з масивом користувачів та вивести інформацію про них.
require 'json'

file = File.read('users.json')
users = JSON.parse(file)

total_age = 0

users.each do |user|
  puts "Name: #{user['name']}, Age: #{user['age']}"
  total_age += user['age']
end

if users.any?
  average_age = total_age.to_f / users.size
  puts "\nAverage Age: #{average_age.round(2)}"
end
