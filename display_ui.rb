require './ui_helper.rb'


def display_calendar
  choice = nil
  until choice == 'x'
    puts "Press 'd' to display events for the day."
    puts "Press 'w' to display events for the week."
    puts "Press 'm' to display events for the month."
    puts "Press 'x' to exit."
    choice = gets.chomp
    case choice
    when 'd'
      display_day
    when 'w'
      display_week
    when 'm'
      display_month
    when 'x'
      return
    else
      puts "FAIL! Try again!"
    end
  end
end

def display_day
  puts "Enter the date whose events you want to view (yy/mm/dd): "
  choice = gets.chomp.to_date
  # p start = DateTime.parse('#{choice} 00:00:00')
  # p stop = DateTime.parse('#{choice} 11:59:59')
  # events = Event.where("start >= :start AND stop <= :stop", :start => start, :stop => stop)
  events = Event.find(:all, :conditions => { :start => start_date..end_date } )
  events.each { |event| puts "#{event.id}    #{event.name}    #{event.start}     #{event.stop}" }

end




  
