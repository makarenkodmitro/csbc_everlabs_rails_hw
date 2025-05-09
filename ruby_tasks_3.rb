#3. Створити програму командного рядка на Ruby, яка дозволяє додавати, переглядати та видаляти задачі.
tasks = []

def show_menu
  puts "1. Add Task"
  puts "2. Show Tasks"
  puts "3. Delete Task"
  puts "4. Exit"
  print "Choose an option: "
end

loop do
  show_menu
  choice = gets.chomp

  case choice
  when "1"
    print "Enter new task: "
    task = gets.chomp
    tasks << task
    puts "Task added!"

  when "2"
    if tasks.empty?
      puts "No tasks found."
    else
      puts "\nCurrent Tasks:"
      tasks.each_with_index do |task, index|
        puts "#{index + 1}. #{task}"
      end
    end

  when "3"
    if tasks.empty?
      puts "No tasks to delete."
    else
      puts "\nTasks:"
      tasks.each_with_index do |task, index|
        puts "#{index + 1}. #{task}"
      end
      print "Enter task number to delete: "
      num = gets.chomp.to_i
      if num.between?(1, tasks.size)
        removed = tasks.delete_at(num - 1)
        puts "Deleted task: #{removed}"
      else
        puts "Invalid task number."
      end
    end

  when "4"
    puts "Goodbye!"
    break

  else
    puts "Invalid option. Please choose 1–4."
  end
end