class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
  end

  def run
    puts "Bienvenue"
    @employee = @sessions_controller.sign_in
    while @employee

      if @employee.manager?
        display_manager_menu
        action = gets.chomp.to_i
        route(action)
      else
        display_delivery_guy_menu
        action = gets.chomp.to_i
        route_delivery(action)
      end
    end
  end

  private

  def route(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then @orders_controller.list_undelivered_orders
    when 6 then @orders_controller.add
    when 0 then stop
    end
  end

  def route_delivery(action)
    case action
    when 1 then @orders_controller.list_my_orders(@employee)
    when 2 then @orders_controller.mark_as_delivered(@employee)
    when 0 then stop
    end
  end

  def display_delivery_guy_menu
    puts "1 - List undelivered orders"
    puts "2 - Mark one as delivered"
  end

  def display_manager_menu
    puts "1 - List meals"
    puts "2 - Add meal"
    puts "3 - List customers"
    puts "4 - Add customer"
    puts "5 - List all undelivered"
    puts "6 - Assign employee to order"
    puts "0 - Quit"
  end

  def stop
    @employee = nil
  end
end
