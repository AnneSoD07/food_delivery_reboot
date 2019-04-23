class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    puts "Bienvenue"

    while @running
      action = display_menu
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

  def display_menu
    puts "1 - List meals"
    puts "2 - Add meal"
    puts "3 - List customers"
    puts "4 - Add customer"
    puts "0 - Quit"
    gets.chomp.to_i
  end

  def stop
    @running = false
  end
end
