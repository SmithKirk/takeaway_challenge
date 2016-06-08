class Takeaway

  def initialize(menu:)
    @menu = menu
  end

  def view_menu
    menu.print_menu
  end

  private
  attr_reader :menu
end
