class MealsView
  def display_all(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1} - #{meal.name}"
    end
  end

  def ask_for(stuff)
    puts "Give a #{stuff}"
    gets.chomp
  end

  def ask_for_index(action)
    puts "Which meal do you want to #{action}"
    gets.chomp.to_i - 1
  end
end
