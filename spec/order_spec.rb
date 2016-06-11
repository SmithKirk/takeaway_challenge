describe Order do
  subject(:order){described_class.new(menu)}
  let(:menu){instance_double('Menu')}

  let(:dishes) do
    {
      burger: 2,
      chips: 1
    }
  end

  describe '#add' do
    before do
      add_dish_and_price_to_menu
    end

    it 'selects several dishes from the menu' do
      create_order
      expect(order.dishes).to eq(dishes)
    end

    it 'only allows dishes from menu to be added' do
      allow(menu).to receive(:has_dish?).with(:pizza).and_return(false)
      expect{order.add(:pizza, 2)}.to raise_error(NoItemError, 'Pizza is not on the menu')
    end
  end

  describe '#total' do
    before do
      add_dish_and_price_to_menu
    end

    it 'calculates a total for order' do
      create_order
      total = 7.50
      expect(order.total).to eq total
    end
  end

  def create_order
    order.add(:burger, 2)
    order.add(:chips, 1)
  end

  def add_dish_and_price_to_menu
    allow(menu).to receive(:has_dish?).with(:burger).and_return(true)
    allow(menu).to receive(:has_dish?).with(:chips).and_return(true)

    allow(menu).to receive(:price).with(:burger).and_return(3.00)
    allow(menu).to receive(:price).with(:chips).and_return(1.50)
  end
end
