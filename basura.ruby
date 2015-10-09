(-7..-1).each do |i|
  #puts "#{((Time.now.midnight)..Time.now.midnight+i.day)}"
  puts "#{(Time.now.midnight+i.day..(Time.now.midnight))}"
end

