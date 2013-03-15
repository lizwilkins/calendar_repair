require './ui_helper'

def todo_menu
  choice = nil
  until choice == 'x'
    puts "Press 'a' to add a todo."
    puts "Press 'm' to mark a todo item as done."
    puts "Press 'l' to list your todos."
    puts "Press 'e' to edit a todo."
    puts "Press 'd' to delete a todo"
    puts "Press 'x' to exit."
    choice = gets.chomp
    case choice
    when 'a'
      name = add_new_todo
    when 'm'
      mark_done
    when 'l'
      list_todos
    when 'e'
      edit_todo
    when 'd'
      delete_todo
    when 'x'
      return
    else
      puts "FAIL! Try again!"
    end
  end
end


def add_new_todo
  print "Enter the todo name:  "
  todo = Todo.create(:name => gets.chomp)
  print "Do you want to add a note to your todo (y/n):  " 
  if gets.chomp == 'y'
    puts 'What would you like to note on your todo?'
    todo.notes.create(:name => gets.chomp)
  end
  return
end

def list_todos
  Todo.all.each { |todo| puts "ID: #{todo.id}  todo: #{todo.name}" }
end

def edit_todo  # does not allow for modification of existing note
  list_todos
  print "Please enter the ID for the todo you want to edit: "
  todo = Todo.find(gets.chomp)
  puts "#{todo.id}    #{todo.name}"
  print "Is this the todo that you want to edit: y/n "
  if gets.chomp == 'y'
    print "Enter the todo text: "
    todo.update_attributes(:name => gets.chomp)
  else
    edit_todo
  end
end

def delete_todo
  list_todos
  print "Please enter the ID for the todo you want to delete: "
  todo = Todo.find(gets.chomp)
  puts "#{todo.id}    #{todo.name}"
  print "Is this the todo that you want to delete: y/n "
  if gets.chomp == 'y'
    todo.destroy 
    puts "Deleted todo '#{todo.name}'"
  end
end
