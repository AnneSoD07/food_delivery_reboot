require_relative '../views/customers_view'
require_relative '../models/customer'

class CustomersController
  def initialize(repository)
    @repository = repository
    @view = CustomersView.new
  end

  def list
    customers = @repository.all
    @view.display_all(customers)
  end

  def add
    name = @view.ask_for('name')
    address = @view.ask_for('address')
    customer = Customer.new(name: name, address: address)
    @repository.add(customer)
  end
end
