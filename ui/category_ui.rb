require './ui_helper.rb'

def category_menu
  choice = nil
  until choice == 'x'
    puts "Press 'a' to add a category."
    puts "Press 'l' to list your categories."
    puts "Press 'e' to edit a category."
    puts "Press 'd' to delete a category"
    puts "Press 'x' to exit."
    choice = gets.chomp
    case choice
    when 'a'
      name = add_new_category
    when 'l'
      list_categories
    when 'e'
      edit_category
    when 'd'
      delete_category
    when 'x'
      return
    else
      puts "FAIL! Try again!"
    end
  end
end


def add_new_category
  print "Enter the name of the category: "
  Category.create(:name => gets.chomp)
end

def list_categories
  Category.all.each { |category| puts "ID: #{category.id}  Category Name: #{category.name}" }
end

def edit_category
  list_categories
  print "Please enter the ID for the category you want to edit: "
  category = Category.find(gets.chomp)
  puts "#{category.id}    #{category.name}"
  print "Is this the category that you want to edit: y/n "
  if gets.chomp == 'y'
    print "Enter the name of the category: "
    category.update_attributes(:name => gets.chomp)
  else
    edit_category
  end

end

def delete_category
  list_categories
  print "Please enter the ID for the category you want to delete: "
  category = Category.find(gets.chomp)
  puts "#{category.id}    #{category.name}"
  print "Is this the category that you want to delete: y/n "
  if gets.chomp == 'y'
    category.destroy 
    puts "Deleted category '#{category.name}'"
  end
end
