require_relative '../views/meals_view'
require_relative '../models/meal'

class MealsController
  def initialize(repository)
    @repository = repository
    @view = MealsView.new
  end

  def list
    # demader au repo le tableau
    meals = @repository.all
    # donner le tableau a la vue pour affichage
    @view.display_all(meals)
  end

  def add
    # demander a l'utilisateur un nom
    name = @view.ask_for('name')
    # demander a l'utilisateur un prix
    price = @view.ask_for('price').to_i
    # Creer un Meal
    meal = Meal.new(name: name, price: price)
    # l'ajouter dans le repo
    @repository.add(meal)
  end
end
