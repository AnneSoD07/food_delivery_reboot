require_relative 'base_repository'
require_relative '../models/order'
require 'byebug'

class OrderRepository < BaseRepository
  def initialize(csv_file, meal_repository, employee_repository, customer_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    super(csv_file)
  end

  def build_element(row)
    row[:id] = row[:id].to_i
    row[:delivered] = row[:delivered] == 'true'
    row[:meal] = @meal_repository.find(row[:meal_id].to_i)
    row[:customer] = @customer_repository.find(row[:customer_id].to_i)
    row[:employee] = @employee_repository.find(row[:employee_id].to_i)

    Order.new(row)
  end

  def save
    save_csv
  end

  def csv_headers
    %w[id delivered meal_id employee_id customer_id]
  end

  def undelivered_orders
    @elements.find_all { |order| !order.delivered? }
  end
end
