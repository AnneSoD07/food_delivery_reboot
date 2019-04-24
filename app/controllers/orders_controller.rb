require_relative '../views/orders_view'
require_relative '../models/order'

class OrdersController
  def initialize(meal_repository, employee_repository, customer_repository, order_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @view = OrdersView.new
  end

  def list_undelivered_orders
    orders = @order_repository.undelivered_orders
    @view.display_all(orders)
  end

  def add
    # demander un meal id
    meal_id = @view.ask_for("meal id").to_i
    # demander un customer id
    customer_id = @view.ask_for("customer id").to_i
    # demander un employee id
    employee_id = @view.ask_for("employee id").to_i
    # recuperer dans les repos
    meal = @meal_repository.find(meal_id)
    customer = @customer_repository.find(customer_id)
    employee = @employee_repository.find(employee_id)
    # Fabriquer la commander
    order = Order.new(meal: meal, customer: customer, employee: employee)
    # la stocker dans le repo
    @order_repository.add(order)
  end

  def list_my_orders(employee)
    orders = undelivered_orders.find_all { |order| order.employee == employee }
    @view.display_all(orders)
  end

  def mark_as_delivered(employee)
    orders = undelivered_orders.find_all { |order| order.employee == employee }
    @view.display_all(orders)
    id = @view.ask_for("id").to_i
    order = @order_repository.find(id)
    order.deliver!
    @order_repository.save
  end

  private

  def undelivered_orders
    @order_repository.undelivered_orders
  end
end
