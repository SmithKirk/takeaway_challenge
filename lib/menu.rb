class Menu

  attr_reader :dishes

  def initialize
    @dishes = {}
  end

  def add_dish(dish_name, price)
    @dishes[dish_name.to_sym] = price
  end

  def remove_dish(dish_name)
    @dishes.delete(dish_name)
  end
end
