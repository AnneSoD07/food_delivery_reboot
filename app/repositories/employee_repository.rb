require 'csv'
require_relative 'base_repository'
require_relative '../models/employee'

class EmployeeRepository < BaseRepository
  undef_method :add

  def find_by_username(username)
    @elements.find { |element| element.username == username }
  end

  def all_delivery_guys
    @elements.select { |employee| employee.delivery_guy? }
  end

  private

  def build_element(row)
    row[:id] = row[:id].to_i
    Employee.new(row)
  end

  def csv_headers
    %w(id username password role)
  end
end
