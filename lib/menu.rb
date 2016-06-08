class Menu

  attr_accessor  :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def add_dish(dish_name, price)
    @dishes[dish_name.to_sym] = price
  end

  def remove_dish(dish_name)
    raise 'Error: That dish is not on the menu' unless has_dish?(dish_name)
    @dishes.delete(dish_name)
  end

  def print_menu
    @dishes.map do |title, price|
      "%s £%.2f" % [title.to_s.capitalize, price]
    end.join(", ")
  end

  private
  def has_dish?(dish_name)
    @dishes.has_key?(dish_name)
  end
end
