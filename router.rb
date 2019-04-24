class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
  end

  def run
    puts "Bienvenue"
    @employee = @sessions_controller.sign_in
    while @employee
      action = @employee.manager? ? display_manager_menu : display_delivery_guy_menu
      route(action)
    end
  end

  private

  def route(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 0 then stop
    end
  end

  def display_delivery_guy_menu
    puts "TODO DELIVERY GUY MENU"
    gets.chomp.to_i
  end

  def display_manager_menu
    puts "1 - List meals"
    puts "2 - Add meal"
    puts "3 - List customers"
    puts "4 - Add customer"
    puts "0 - Quit"
    gets.chomp.to_i
  end

  def stop
    @employee = nil
  end
end
