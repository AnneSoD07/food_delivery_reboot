require 'byebug'

class OrdersView
  def display_all(orders)
    orders.each do |order|
      puts "#{order.id} - #{order.customer.name} #{order.meal.name} #{order.employee.username}"
    end
  end

  def ask_for(stuff)
    puts "Give a #{stuff}"
    gets.chomp
  end
end
