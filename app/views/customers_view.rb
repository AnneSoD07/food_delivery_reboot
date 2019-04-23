class CustomersView
  def display_all(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1} - #{customer.name}"
    end
  end

  def ask_for(stuff)
    puts "Give a #{stuff}"
    gets.chomp
  end

  def ask_for_index(action)
    puts "Which customer do you want to #{action}"
    gets.chomp.to_i - 1
  end
end
