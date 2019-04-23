require_relative 'app/controllers/meals_controller'
require_relative 'app/controllers/customers_controller'

require_relative 'app/repositories/meal_repository'
require_relative 'app/repositories/customer_repository'

require_relative 'router'

meals_repository = MealRepository.new('data/meals.csv')
customers_repository = CustomerRepository.new('data/customers.csv')

meals_controller = MealsController.new(meals_repository)
customers_controller = CustomersController.new(customers_repository)

router = Router.new(meals_controller, customers_controller)
router.run
