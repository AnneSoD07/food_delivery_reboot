require 'csv'
require_relative 'base_repository'

class MealRepository < BaseRepository
  def build_element(row)
    row[:id] = row[:id].to_i
    row[:price] = row[:price].to_i
    Meal.new(row)
  end

  def csv_headers
    %w[id name price]
  end
end
