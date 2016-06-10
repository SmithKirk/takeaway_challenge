class Menu

  attr_accessor  :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def add_dish(dish, price)
    @dishes[dish.to_sym] = price
  end

  def remove_dish(dish)
    raise 'Error: That dish is not on the menu' unless has_dish?(dish)
    @dishes.delete(dish)
  end

  def print_menu
    @dishes.map do |title, price|
      "%s £%.2f" % [title.to_s.capitalize, price]
    end.join(", ")
  end

  def has_dish?(dish)
    @dishes.has_key?(dish)
  end
end
