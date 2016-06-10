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
      allow(menu).to receive(:has_dish?).with(:burger).and_return(true)
      allow(menu).to receive(:has_dish?).with(:chips).and_return(true)
    end

    it 'selects several dishes from the menu' do
      order.add(:burger, 2)
      order.add(:chips, 1)
      expect(order.dishes).to eq(dishes)
    end

    it 'only allows dishes from menu to be added' do
      allow(menu).to receive(:has_dish?).with(:pizza).and_return(false)
      expect{order.add(:pizza, 2)}.to raise_error(NoItemError, 'Pizza is not on the menu')
    end
  end
end
