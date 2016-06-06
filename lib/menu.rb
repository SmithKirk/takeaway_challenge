class Menu

  attr_reader :dishes

  def initialize
    @dishes = {}
  end

  def add_dish(dish_name, price)
    @dishes[dish_name.to_sym] = price
  end
end
